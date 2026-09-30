import 'dart:ui' show Tristate;

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sli_common/sli_common.dart';

void main() {
  testWidgets('invokes callback when enabled', (tester) async {
    var pressed = false;
    await tester.pumpWidget(
      MaterialApp(
        theme: SliTheme.light(),
        home: Scaffold(
          body: SliButton(label: 'Continue', onPressed: () => pressed = true),
        ),
      ),
    );

    await tester.tap(find.text('Continue'));
    expect(pressed, isTrue);
  });

  testWidgets('loading state disables callback and shows progress', (
    tester,
  ) async {
    var pressed = false;
    await tester.pumpWidget(
      MaterialApp(
        theme: SliTheme.dark(),
        home: Scaffold(
          body: SliButton(
            label: 'Save',
            isLoading: true,
            onPressed: () => pressed = true,
          ),
        ),
      ),
    );

    await tester.tap(find.byType(SliButton));
    expect(pressed, isFalse);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('all variants and sizes preserve the minimum touch target', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: SliTheme.light(),
        home: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                for (final variant in SliButtonVariant.values)
                  for (final size in SliButtonSize.values)
                    SliButton(
                      key: ValueKey('${variant.name}-${size.name}'),
                      label: '${variant.name}-${size.name}',
                      variant: variant,
                      size: size,
                      onPressed: () {},
                    ),
              ],
            ),
          ),
        ),
      ),
    );

    for (final variant in SliButtonVariant.values) {
      for (final size in SliButtonSize.values) {
        final renderedSize = tester.getSize(
          find.byKey(ValueKey('${variant.name}-${size.name}')),
        );
        expect(renderedSize.width, greaterThanOrEqualTo(48));
        expect(renderedSize.height, greaterThanOrEqualTo(48));
      }
    }
  });

  testWidgets('exposes one semantic button label and enabled state', (
    tester,
  ) async {
    final semantics = tester.ensureSemantics();

    await tester.pumpWidget(
      MaterialApp(
        theme: SliTheme.light(),
        home: Scaffold(
          body: SliButton(
            label: 'Save',
            semanticLabel: 'Save changes',
            onPressed: () {},
          ),
        ),
      ),
    );

    final node = tester.getSemantics(find.bySemanticsLabel('Save changes'));
    expect(node.flagsCollection.isButton, isTrue);
    expect(node.flagsCollection.isEnabled, Tristate.isTrue);
    semantics.dispose();
  });
}
