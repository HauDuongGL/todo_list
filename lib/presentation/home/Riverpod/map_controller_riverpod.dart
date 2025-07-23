import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

final mapControllerRiverpod = StateProvider<MapboxMap?>((ref) => null);
