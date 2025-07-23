import 'package:flutter_base_bloc/core/exception/app_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart' as gl;
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

final locationTrackingRiverpod = StreamProvider<Position>((ref) async* {
  try {
    final serviceEnable = await gl.Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      throw const UnCatchException(
          overridMessage: 'Location services are disabled.');
    }
    var permission = await gl.Geolocator.checkPermission();
    if (permission == gl.LocationPermission.denied) {
      permission = await gl.Geolocator.requestPermission();
    }
    if (permission == gl.LocationPermission.deniedForever) {
      throw const UnCatchException(
          overridMessage: 'Location permissions are permanently denied.');
    }

    yield* gl.Geolocator.getPositionStream(
      locationSettings: const gl.LocationSettings(
        accuracy: gl.LocationAccuracy.high,
        distanceFilter: 50,
      ),
    ).map(
      (pos) => Position(pos.longitude, pos.latitude),
    );
  } catch (e) {
    throw UnCatchException(
      overridMessage: e.toString(),
    );
  }
});
