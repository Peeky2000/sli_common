// One golden per kit state ID (the-forge-design kits/trial-kit/1.0.0), framed like the catalog `.kit` block:
// 358 logical px wide, white background, 16 px padding, device pixel ratio 2.
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sli_common/sli_common.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    await Future.wait([
      _loadFlutterFont('Roboto', ['Roboto-Regular.ttf', 'Roboto-Medium.ttf']),
      _loadFlutterFont('MaterialIcons', ['MaterialIcons-Regular.otf']),
    ]);
  });

  final states = <String, Widget Function()>{
    'button.primary.default': () =>
        SliKitButton(label: 'Đăng nhập', onPressed: () {}),
    'button.primary.pressed': () =>
        SliKitButton(label: 'Đăng nhập', onPressed: () {}, forcePressed: true),
    'button.primary.disabled': () => const SliKitButton(label: 'Đăng nhập'),
    'button.primary.loading': () =>
        SliKitButton(label: 'Đăng nhập', onPressed: () {}, isLoading: true),
    'text-field.outlined.default': () =>
        const SliKitTextField(label: 'Email', hintText: 'Nhập email'),
    'text-field.outlined.focused': () => _Focused(
      child: (node) => SliKitTextField(
        label: 'Email',
        hintText: 'Nhập email',
        focusNode: node,
      ),
    ),
    'text-field.outlined.filled': () => SliKitTextField(
      label: 'Email',
      controller: TextEditingController(text: 'long@example.com'),
    ),
    'text-field.outlined.error': () => SliKitTextField(
      label: 'Email',
      controller: TextEditingController(text: 'long@example.com'),
      errorText: 'Email không hợp lệ',
    ),
    'text-field.outlined.pressed': () => _Focused(
      child: (node) => SliKitTextField(
        label: 'Email',
        hintText: 'Nhập email',
        focusNode: node,
      ),
    ),
    'text-field.outlined.disabled': () => SliKitTextField(
      label: 'Email',
      controller: TextEditingController(text: 'long@example.com'),
      enabled: false,
    ),
    'otp-field.six-digit.default': () => const SliKitOtpField(value: ''),
    'otp-field.six-digit.partial': () => const SliKitOtpField(value: '482'),
    'otp-field.six-digit.error': () =>
        const SliKitOtpField(value: '482913', hasError: true),
  };

  for (final entry in states.entries) {
    testWidgets('kit ${entry.key}', (tester) async {
      tester.view.devicePixelRatio = 2;
      tester.view.physicalSize = const Size(430 * 2, 400 * 2);
      addTearDown(tester.view.reset);
      final key = GlobalKey();
      await tester.pumpWidget(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: KitTokens.theme(),
          home: Scaffold(
            backgroundColor: KitTokens.trialKit.surface,
            body: Align(
              alignment: Alignment.topLeft,
              child: RepaintBoundary(
                key: key,
                child: Container(
                  width: 358,
                  color: KitTokens.trialKit.background,
                  padding: const EdgeInsets.all(16),
                  child: entry.value(),
                ),
              ),
            ),
          ),
        ),
      );
      // Let focus land and InputDecorator's border animation finish; the cursor blinks, so no pumpAndSettle.
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 400));
      await expectLater(
        find.byKey(key),
        matchesGoldenFile('../goldens/kit/${entry.key}.png'),
      );
    });
  }
}

class _Focused extends StatefulWidget {
  const _Focused({required this.child});
  final Widget Function(FocusNode node) child;
  @override
  State<_Focused> createState() => _FocusedState();
}

class _FocusedState extends State<_Focused> {
  final node = FocusNode();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => node.requestFocus());
  }

  @override
  void dispose() {
    node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child(node);
}

Future<void> _loadFlutterFont(String family, List<String> files) async {
  var directory = File(Platform.resolvedExecutable).parent;
  while (directory.parent.path != directory.path) {
    final base = '${directory.path}/bin/cache/artifacts/material_fonts';
    if (File('$base/${files.first}').existsSync()) {
      final loader = FontLoader(family);
      for (final f in files) {
        loader.addFont(
          File('$base/$f').readAsBytes().then(ByteData.sublistView),
        );
      }
      await loader.load();
      return;
    }
    directory = directory.parent;
  }
  throw StateError('Không tìm thấy font $family trong Flutter SDK');
}
