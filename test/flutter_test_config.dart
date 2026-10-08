import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/foundation.dart' show FlutterError;
import 'package:flutter_test/flutter_test.dart';

/// Allowed share of differing pixels when comparing a golden image.
///
/// Goldens are recorded on macOS. Linux CI rasterizes text with a different
/// font backend, which moves glyph edges by a pixel and changed about 1.3% of
/// the catalog pilot image while the layout stayed identical. 2% absorbs that
/// anti-aliasing noise; a moved, recolored or missing component changes far
/// more pixels and still fails.
const double goldenDiffTolerance = 0.02;

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  final current = goldenFileComparator;
  if (current is LocalFileComparator) {
    goldenFileComparator = TolerantGoldenComparator(
      current.basedir,
      tolerance: goldenDiffTolerance,
    );
  }
  await testMain();
}

/// A [LocalFileComparator] that accepts a small share of differing pixels.
class TolerantGoldenComparator extends LocalFileComparator {
  TolerantGoldenComparator(Uri basedir, {required this.tolerance})
    : assert(tolerance >= 0 && tolerance < 1),
      super(basedir.resolve('flutter_test_config.dart'));

  final double tolerance;

  @override
  Future<bool> compare(Uint8List imageBytes, Uri golden) async {
    final result = await GoldenFileComparator.compareLists(
      imageBytes,
      await getGoldenBytes(golden),
    );
    final passed = result.passed || result.diffPercent <= tolerance;
    if (passed) {
      result.dispose();
      return true;
    }
    final error = await generateFailureOutput(result, golden, basedir);
    result.dispose();
    throw FlutterError(error);
  }
}
