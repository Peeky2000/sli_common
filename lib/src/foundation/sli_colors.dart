import 'package:flutter/material.dart';

@immutable
class SliColors extends ThemeExtension<SliColors> {
  const SliColors({
    required this.background,
    required this.surface,
    required this.foreground,
    required this.mutedForeground,
    required this.primary,
    required this.onPrimary,
    required this.border,
    required this.destructive,
    required this.onDestructive,
    required this.success,
  });

  static const light = SliColors(
    background: Color(0xFFFFFFFF),
    surface: Color(0xFFF8FAFC),
    foreground: Color(0xFF0F172A),
    mutedForeground: Color(0xFF64748B),
    primary: Color(0xFF18181B),
    onPrimary: Color(0xFFFAFAFA),
    border: Color(0xFFE2E8F0),
    destructive: Color(0xFFDC2626),
    onDestructive: Color(0xFFFFFFFF),
    success: Color(0xFF16A34A),
  );

  static const dark = SliColors(
    background: Color(0xFF09090B),
    surface: Color(0xFF18181B),
    foreground: Color(0xFFFAFAFA),
    mutedForeground: Color(0xFFA1A1AA),
    primary: Color(0xFFFAFAFA),
    onPrimary: Color(0xFF18181B),
    border: Color(0xFF27272A),
    destructive: Color(0xFFEF4444),
    onDestructive: Color(0xFFFFFFFF),
    success: Color(0xFF22C55E),
  );

  final Color background;
  final Color surface;
  final Color foreground;
  final Color mutedForeground;
  final Color primary;
  final Color onPrimary;
  final Color border;
  final Color destructive;
  final Color onDestructive;
  final Color success;

  @override
  SliColors copyWith({
    Color? background,
    Color? surface,
    Color? foreground,
    Color? mutedForeground,
    Color? primary,
    Color? onPrimary,
    Color? border,
    Color? destructive,
    Color? onDestructive,
    Color? success,
  }) => SliColors(
    background: background ?? this.background,
    surface: surface ?? this.surface,
    foreground: foreground ?? this.foreground,
    mutedForeground: mutedForeground ?? this.mutedForeground,
    primary: primary ?? this.primary,
    onPrimary: onPrimary ?? this.onPrimary,
    border: border ?? this.border,
    destructive: destructive ?? this.destructive,
    onDestructive: onDestructive ?? this.onDestructive,
    success: success ?? this.success,
  );

  @override
  SliColors lerp(covariant SliColors? other, double t) {
    if (other == null) return this;
    return SliColors(
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      foreground: Color.lerp(foreground, other.foreground, t)!,
      mutedForeground: Color.lerp(mutedForeground, other.mutedForeground, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      border: Color.lerp(border, other.border, t)!,
      destructive: Color.lerp(destructive, other.destructive, t)!,
      onDestructive: Color.lerp(onDestructive, other.onDestructive, t)!,
      success: Color.lerp(success, other.success, t)!,
    );
  }
}

extension SliColorsContext on BuildContext {
  SliColors get sliColors =>
      Theme.of(this).extension<SliColors>() ??
      (Theme.of(this).brightness == Brightness.dark
          ? SliColors.dark
          : SliColors.light);
}
