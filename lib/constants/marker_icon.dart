// ignore_for_file: unused_local_variable

import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<BitmapDescriptor> createCustomMarkerBitmap(String assetPath) async {
  const ImageConfiguration imageConfiguration = ImageConfiguration();
  final ByteData byteData = await rootBundle.load(assetPath);
  final ui.Codec codec = await ui.instantiateImageCodec(
    byteData.buffer.asUint8List(),
    targetWidth: 48, // Set your desired width here
    targetHeight: 48, // Set your desired height here
  );
  final ui.FrameInfo frameInfo = await codec.getNextFrame();
  final ui.Image image = frameInfo.image;

  final ByteData? byteDataImg = await image.toByteData(
    format: ui.ImageByteFormat.png,
  );
  final Uint8List pngBytes = byteDataImg!.buffer.asUint8List();

  return BitmapDescriptor.bytes(pngBytes);
}
