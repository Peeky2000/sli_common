import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../flutter_test_config.dart';

/// Draws a 100x100 white PNG with [changed] black pixels in the first rows.
Future<Uint8List> _png(int changed) async {
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder);
  canvas.drawRect(
    const Rect.fromLTWH(0, 0, 100, 100),
    Paint()..color = const Color(0xFFFFFFFF),
  );
  final black = Paint()..color = const Color(0xFF000000);
  for (var i = 0; i < changed; i++) {
    canvas.drawRect(
      Rect.fromLTWH((i % 100).toDouble(), (i ~/ 100).toDouble(), 1, 1),
      black,
    );
  }
  final image = await recorder.endRecording().toImage(100, 100);
  final data = await image.toByteData(format: ui.ImageByteFormat.png);
  image.dispose();
  return data!.buffer.asUint8List();
}

void main() {
  late Directory dir;
  late TolerantGoldenComparator comparator;

  setUp(() {
    dir = Directory.systemTemp.createTempSync('golden_tolerance_');
    comparator = TolerantGoldenComparator(
      Uri.directory(dir.path),
      tolerance: goldenDiffTolerance,
    );
  });

  tearDown(() => dir.deleteSync(recursive: true));

  testWidgets('accepts anti-aliasing noise below the tolerance', (
    tester,
  ) async {
    await tester.runAsync(() async {
      File('${dir.path}/g.png').writeAsBytesSync(await _png(0));
      // 30 of 10000 pixels: rasterizer noise between two Linux runs.
      expect(
        await comparator.compare(await _png(30), Uri.parse('g.png')),
        isTrue,
      );
    });
  });

  testWidgets('still fails a real visual change', (tester) async {
    await tester.runAsync(() async {
      File('${dir.path}/g.png').writeAsBytesSync(await _png(0));
      await expectLater(
        comparator.compare(await _png(200), Uri.parse('g.png')),
        throwsA(isA<FlutterError>()),
      );
    });
  });
}
