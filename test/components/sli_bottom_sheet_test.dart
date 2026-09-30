import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sli_common/sli_common.dart';

void main() {
  for (final brightness in Brightness.values) {
    testWidgets('frame renders header and body in ${brightness.name} theme', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: SliTheme.light(),
          darkTheme: SliTheme.dark(),
          themeMode: brightness == Brightness.dark
              ? ThemeMode.dark
              : ThemeMode.light,
          home: const Scaffold(
            body: SliBottomSheetFrame(
              title: 'Bộ lọc',
              subtitle: 'Chọn ít nhất một mục',
              child: Text('Nội dung'),
            ),
          ),
        ),
      );

      expect(find.text('Bộ lọc'), findsOneWidget);
      expect(find.text('Chọn ít nhất một mục'), findsOneWidget);
      expect(find.text('Nội dung'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('close action has semantics and minimum touch target', (
    tester,
  ) async {
    final semantics = tester.ensureSemantics();
    var closed = false;

    await tester.pumpWidget(
      MaterialApp(
        theme: SliTheme.light(),
        home: Scaffold(
          body: SliBottomSheetFrame(
            title: 'Bộ lọc',
            onClose: () => closed = true,
            child: const Text('Nội dung'),
          ),
        ),
      ),
    );

    final close = find.bySemanticsLabel('Close');
    expect(close, findsOneWidget);
    final node = tester.getSemantics(close);
    expect(node.flagsCollection.isButton, isTrue);
    final size = tester.getSize(close);
    expect(size.width, greaterThanOrEqualTo(SliTouchTarget.minimum.width));
    expect(size.height, greaterThanOrEqualTo(SliTouchTarget.minimum.height));

    await tester.tap(close);
    expect(closed, isTrue);
    semantics.dispose();
  });

  testWidgets('fit-content and fixed sizing stay within the viewport', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(400, 600));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(
      MaterialApp(
        theme: SliTheme.light(),
        home: const Scaffold(
          body: Column(
            children: [
              SliBottomSheetFrame(
                key: ValueKey('fit'),
                showCloseButton: false,
                maxHeight: 200,
                child: SizedBox(height: 80),
              ),
              Expanded(
                child: SliBottomSheetFrame(
                  key: ValueKey('fixed'),
                  showCloseButton: false,
                  height: 1000,
                  child: SizedBox.shrink(),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    expect(tester.getSize(find.byKey(const ValueKey('fit'))).height, 80);
    expect(
      tester.getSize(find.byKey(const ValueKey('fixed'))).height,
      lessThanOrEqualTo(600),
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('presenter returns result and follows keyboard inset', (
    tester,
  ) async {
    int? result;

    await tester.pumpWidget(
      MaterialApp(
        theme: SliTheme.light(),
        home: Scaffold(
          body: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () async {
                result = await showSliBottomSheet<int>(
                  context: context,
                  builder: (sheetContext) => SliBottomSheetFrame(
                    title: 'Xác nhận',
                    child: TextButton(
                      onPressed: () => Navigator.pop(sheetContext, 7),
                      child: const Text('Hoàn tất'),
                    ),
                  ),
                );
              },
              child: const Text('Mở sheet'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Mở sheet'));
    await tester.pumpAndSettle();

    tester.view.viewInsets = const FakeViewPadding(bottom: 120);
    addTearDown(tester.view.resetViewInsets);
    await tester.pumpAndSettle();

    final padding = tester.widget<AnimatedPadding>(
      find.byType(AnimatedPadding),
    );
    expect(
      padding.padding,
      EdgeInsets.only(bottom: 120 / tester.view.devicePixelRatio),
    );

    await tester.tap(find.text('Hoàn tất'));
    await tester.pumpAndSettle();
    expect(result, 7);
  });
}
