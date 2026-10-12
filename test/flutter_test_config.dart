import 'dart:async';
import 'dart:io' show Platform;
import 'dart:typed_data';

import 'package:flutter/foundation.dart' show FlutterError;
import 'package:flutter_test/flutter_test.dart';

/// Allowed share of differing pixels when comparing a golden image.
///
/// Goldens are recorded and compared on Linux only (GitHub Actions
/// `ubuntu-latest`, workflow `update-goldens.yml`), so the same font backend
/// draws both sides and only tiny noise is expected. A moved, recolored or
/// missing component changes far more pixels and still fails.
const double goldenDiffTolerance = 0.005;

/// The only platform whose rendering the committed goldens describe.
///
/// macOS and Windows draw glyph edges differently, which moved 2-4% of the
/// text field goldens while nothing visual had changed.
bool get isGoldenPlatform => Platform.isLinux;

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  final current = goldenFileComparator;
  if (current is LocalFileComparator) {
    goldenFileComparator = isGoldenPlatform
        ? TolerantGoldenComparator(
            current.basedir,
            tolerance: goldenDiffTolerance,
          )
        : SkippingGoldenComparator(current.basedir);
  }
  await testMain();
}

/// Renders golden tests off Linux without comparing or writing images.
///
/// The widget still builds and lays out, so crashes and overflows fail as
/// usual. Regenerate images with the `update-goldens` workflow instead of
/// `--update-goldens` on this machine.
class SkippingGoldenComparator extends LocalFileComparator {
  SkippingGoldenComparator(Uri basedir)
    : super(basedir.resolve('flutter_test_config.dart'));

  @override
  Future<bool> compare(Uint8List imageBytes, Uri golden) async => true;

  @override
  Future<void> update(Uri golden, Uint8List imageBytes) async {
    throw FlutterError(
      'Goldens are recorded on Linux only. Run the "update-goldens" workflow '
      'on GitHub (scripts/update_goldens.sh) instead of --update-goldens on '
      '${Platform.operatingSystem}.',
    );
  }
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
