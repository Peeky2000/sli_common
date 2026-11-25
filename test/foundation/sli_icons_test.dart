import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:sli_common/sli_common.dart';

void main() {
  test('SliIcons come from the Lucide font bundled by shadcn_flutter', () {
    const icons = [
      SliIcons.home,
      SliIcons.search,
      SliIcons.settings,
      SliIcons.user,
      SliIcons.delete,
      SliIcons.offline,
      SliIcons.delivery,
    ];
    for (final icon in icons) {
      expect(icon.fontFamily, 'LucideIcons');
      expect(icon.fontPackage, 'shadcn_flutter');
    }
    expect(icons.toSet(), hasLength(icons.length));
  });

  testWidgets('an SliIcon renders inside an app', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: Icon(SliIcons.home))),
    );
    expect(find.byIcon(SliIcons.home), findsOneWidget);
  });
}
