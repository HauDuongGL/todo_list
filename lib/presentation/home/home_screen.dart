import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_bloc/core/base/page/base_scafold.dart';
import 'package:flutter_base_bloc/presentation/home/Riverpod/location_permission_riverpod.dart';
import 'package:flutter_base_bloc/presentation/home/Riverpod/location_tracking_riverpod.dart';
import 'package:flutter_base_bloc/presentation/home/Riverpod/map_controller_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final permission = ref.watch(locationPermissionRivepod);
    return permission.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (e, _) => const Center(
        child: Text('Error'),
      ),
      data: (grated) {
        if (!grated) {
          return const Center(
            child: Text('Location permission not granted'),
          );
        }

        return AppScaffold(
          title: 'HOME SCREEN',
          showBackButton: false,
          body: Stack(
            children: [
              MapWidget(
                onMapCreated: (controller) async {
                  ref.read(mapControllerRiverpod.notifier).state = controller;

                  await controller.location.updateSettings(
                    LocationComponentSettings(
                      enabled: true,
                      puckBearingEnabled: true,
                    ),
                  );
                },
              ),
              Consumer(
                builder: (_, ref, __) {
                  final positionAsync = ref.watch(locationTrackingRiverpod);
                  final mapController = ref.watch(mapControllerRiverpod);

                  return positionAsync.when(
                    data: (pos) {
                      mapController?.setCamera(
                        CameraOptions(
                          zoom: 15,
                          center: Point(
                            coordinates: Position(pos.lng, pos.lat),
                          ),
                        ),
                      );
                      return const SizedBox.shrink();
                    },
                    error: (e, _) => const Positioned(
                      child: Text('data'),
                    ),
                    loading: () => const SizedBox.shrink(),
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
