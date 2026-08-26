import 'package:flutter_test/flutter_test.dart';
import 'package:sli_common/sli_common.dart';

void main() {
  test('light and dark themes expose semantic colors', () {
    expect(SliTheme.light().extension<SliColors>(), SliColors.light);
    expect(SliTheme.dark().extension<SliColors>(), SliColors.dark);
  });
}
