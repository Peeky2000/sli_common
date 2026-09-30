import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sli_common/sli_common.dart';

void main() {
  for (final brightness in Brightness.values) {
    testWidgets('renders content in ${brightness.name} theme', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: SliTheme.light(),
          darkTheme: SliTheme.dark(),
          themeMode: brightness == Brightness.dark
              ? ThemeMode.dark
              : ThemeMode.light,
          home: const Scaffold(
            body: SliSurface(child: Text('Account summary')),
          ),
        ),
      );

      expect(find.text('Account summary'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('supports a borderless semantic surface', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: SliTheme.light(),
        home: const Scaffold(
          body: SliSurface(showBorder: false, child: Text('Borderless')),
        ),
      ),
    );

    expect(find.text('Borderless'), findsOneWidget);
  });
}
