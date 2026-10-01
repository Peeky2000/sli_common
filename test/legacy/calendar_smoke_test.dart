import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sli_common/sli_common.dart' as sli;

void main() {
  testWidgets('public single-date calendar renders and accepts a selection', (
    tester,
  ) async {
    DateTime? selected;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: sli.SliCalendarDatePicker(
            initialDate: DateTime(2026, 10, 1),
            currentDate: DateTime(2026, 10, 1),
            firstDate: DateTime(2026, 9, 1),
            lastDate: DateTime(2026, 11, 30),
            onDateChanged: (value) => selected = value,
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
    expect(find.byType(sli.SliCalendarDatePicker), findsOneWidget);
    await tester.tap(find.text('2').first);
    await tester.pumpAndSettle();
    expect(selected, DateTime(2026, 10, 2));
  });

  testWidgets('public date-range calendar export renders', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: sli.CalendarDateRangePicker(
            initialStartDate: DateTime(2026, 10, 1),
            currentDate: DateTime(2026, 10, 1),
            firstDate: DateTime(2026, 9, 1),
            lastDate: DateTime(2026, 11, 30),
            onStartDateChanged: (_) {},
            onEndDateChanged: (_) {},
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);
  });
}
