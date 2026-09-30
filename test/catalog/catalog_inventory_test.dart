import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('every public export has a maturity entry in the catalog inventory', () {
    final barrel = File('lib/sli_common.dart').readAsStringSync();
    final inventory = File(
      'docs/catalog/legacy-inventory.md',
    ).readAsStringSync();
    final exports = RegExp(
      "export '([^']+)';",
    ).allMatches(barrel).map((match) => match.group(1)!).toList();
    final undocumented = exports
        .where((path) => !inventory.contains('`$path`'))
        .toList();

    expect(exports, hasLength(46), reason: 'Update the documented baseline.');
    expect(
      undocumented,
      isEmpty,
      reason: 'Every public export needs category and maturity status.',
    );
  });
}
