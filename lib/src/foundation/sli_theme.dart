import 'package:flutter/material.dart';
import 'package:sli_common/src/foundation/sli_colors.dart';

abstract final class SliTheme {
  static ThemeData light({Color? seedColor}) {
    final seed = seedColor ?? SliColors.light.primary;
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(seedColor: seed),
      scaffoldBackgroundColor: SliColors.light.background,
      extensions: const [SliColors.light],
    );
  }

  static ThemeData dark({Color? seedColor}) {
    final seed = seedColor ?? SliColors.dark.primary;
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: seed,
        brightness: Brightness.dark,
      ),
      scaffoldBackgroundColor: SliColors.dark.background,
      extensions: const [SliColors.dark],
    );
  }
}
