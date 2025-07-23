import 'dart:async';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_bloc/core/network/di/module.dart';
import 'package:flutter_base_bloc/utils/constants/app_constants.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

import 'core/network/di/middle_ware/http_override.dart';
import 'domain/locals/prefs_service.dart';

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  MapboxOptions.setAccessToken(AppConstants.mapbox);
  HttpOverrides.global = MyHttpOverrides();
  await PrefsService.init();
  configureDependencies();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
}
