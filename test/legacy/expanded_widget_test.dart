import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sli_common/sli_common.dart';

void main() {
  for (final axis in Axis.values) {
    testWidgets('expands and collapses on the ${axis.name} axis', (
      tester,
    ) async {
      Future<void> pumpExpanded(bool expand) => tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ExpandedWidget(
              expand: expand,
              axis: axis,
              duration: const Duration(milliseconds: 100),
              child: const SizedBox(width: 120, height: 40),
            ),
          ),
        ),
      );

      await pumpExpanded(false);
      await tester.pumpAndSettle();
      expect(
        tester.widget<SizeTransition>(find.byType(SizeTransition)).axis,
        axis,
      );
      expect(tester.getSize(find.byType(ExpandedWidget)).along(axis), 0);

      await pumpExpanded(true);
      await tester.pumpAndSettle();
      expect(
        tester.getSize(find.byType(ExpandedWidget)).along(axis),
        axis == Axis.vertical ? 40 : 120,
      );

      final transition = tester.widget<SizeTransition>(
        find.byType(SizeTransition),
      );
      expect(
        transition.alignment,
        axis == Axis.vertical ? Alignment.bottomCenter : Alignment.centerRight,
      );
    });
  }
}

extension on Size {
  double along(Axis axis) => axis == Axis.vertical ? height : width;
}
