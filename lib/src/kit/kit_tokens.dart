// GENERATED from the-forge-design kits/trial-kit/1.0.0/tokens/tokens.json — do not edit by hand.
import 'package:flutter/material.dart';

/// Token values of one kit. Components read them by role through [KitTokens.of].
@immutable
class KitTokens extends ThemeExtension<KitTokens> {
  const KitTokens({
    required this.background,
    required this.surface,
    required this.foreground,
    required this.mutedForeground,
    required this.primary,
    required this.primaryPressed,
    required this.onPrimary,
    required this.border,
    required this.borderStrong,
    required this.focus,
    required this.error,
    required this.disabledBg,
    required this.disabledFg,
    required this.radiusMd,
    required this.spaceSm,
    required this.spaceMd,
    required this.spaceLg,
    required this.sizeControl,
    required this.sizeOtpCell,
    required this.borderWidth,
    required this.borderFocusWidth,
    required this.body,
    required this.label,
  });

  static const trialKit = KitTokens(
    background: Color(0xFFFFFFFF),
    surface: Color(0xFFF4F4F5),
    foreground: Color(0xFF18181B),
    mutedForeground: Color(0xFF52525B),
    primary: Color(0xFF27272A),
    primaryPressed: Color(0xFF09090B),
    onPrimary: Color(0xFFFAFAFA),
    border: Color(0xFFD4D4D8),
    borderStrong: Color(0xFF71717A),
    focus: Color(0xFF2563EB),
    error: Color(0xFFB91C1C),
    disabledBg: Color(0xFFE4E4E7),
    disabledFg: Color(0xFF71717A),
    radiusMd: 10,
    spaceSm: 8,
    spaceMd: 12,
    spaceLg: 16,
    sizeControl: 48,
    sizeOtpCell: 48,
    borderWidth: 1,
    borderFocusWidth: 2,
    body: TextStyle(fontFamily: 'Roboto', fontSize: 16, height: 24 / 16),
    label: TextStyle(fontFamily: 'Roboto', fontSize: 14, height: 20 / 14),
  );

  final Color background,
      surface,
      foreground,
      mutedForeground,
      primary,
      primaryPressed,
      onPrimary;
  final Color border, borderStrong, focus, error, disabledBg, disabledFg;
  final double radiusMd,
      spaceSm,
      spaceMd,
      spaceLg,
      sizeControl,
      sizeOtpCell,
      borderWidth,
      borderFocusWidth;
  final TextStyle body, label;

  static KitTokens of(BuildContext context) =>
      Theme.of(context).extension<KitTokens>() ?? trialKit;

  /// ThemeData that installs the kit; apps pass their own [KitTokens] for brand.
  static ThemeData theme([KitTokens tokens = trialKit]) => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: tokens.background,
    colorScheme: ColorScheme.fromSeed(
      seedColor: tokens.primary,
      primary: tokens.primary,
      error: tokens.error,
    ),
    extensions: [tokens],
  );

  @override
  KitTokens copyWith() => this;

  @override
  KitTokens lerp(ThemeExtension<KitTokens>? other, double t) => this;
}
