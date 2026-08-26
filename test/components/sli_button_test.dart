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
}
