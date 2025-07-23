import 'package:flutter_base_bloc/core/exception/app_exception.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

final locationPermissionRivepod = FutureProvider<bool>((ref) async {
  try {
    final status = await Permission.location.request();

    if (status.isGranted) return true;
    if (status.isDenied || status.isPermanentlyDenied) await openAppSettings();

    return false;
  } catch (e) {
    throw UnCatchException(
      overridMessage: e.toString(),
    );
  }
});
