import 'package:flutter/material.dart';

/// Fauma design system color tokens.
///
/// Derived from the "Living Archive" design system.
/// See .stitch/DESIGN.md for the full specification.
abstract final class FaumaColors {
  // ── Brand / Primary ──────────────────────────────────────────────
  static const Color primary = Color(0xFF005258);
  static const Color primaryContainer = Color(0xFF1A6B72);
  static const Color onPrimary = Color(0xFFFFFFFF);

  // ── Tertiary — urgent CTAs, conservation alerts ──────────────────
  static const Color tertiary = Color(0xFF822D28);
  static const Color tertiaryContainer = Color(0xFFA1443D);
  static const Color onTertiary = Color(0xFFFFFFFF);

  // ── Secondary — slate, supporting text ───────────────────────────
  static const Color secondary = Color(0xFF535F71);
  static const Color onSecondary = Color(0xFFFFFFFF);

  // ── Surfaces — sandy cream canvas ────────────────────────────────
  static const Color surface = Color(0xFFFFF8F2);
  static const Color surfaceContainerLow = Color(0xFFF9F2EC);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color onSurface = Color(0xFF1E1B18);
  static const Color onSurfaceVariant = Color(0xFF535F71);

  // ── Outlines ─────────────────────────────────────────────────────
  static const Color outlineVariant = Color(0xFFBEC8C9);

  // ── Override / accent colors ─────────────────────────────────────
  /// Coral accent used for prominent CTAs.
  static const Color coralCta = Color(0xFFF4847A);

  // ── Gradient stops for primary buttons ───────────────────────────
  static const Color gradientStart = Color(0xFF005258);
  static const Color gradientEnd = Color(0xFF1A6B72);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [gradientStart, gradientEnd],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  // ── Whisper shadow (ambient, 6% opacity) ─────────────────────────
  static const Color whisperShadow = Color(0x0F1E1B18); // 6% of onSurface

  // ── Glass surface ────────────────────────────────────────────────
  /// Surface at 80% opacity for floating / glass elements.
  static const Color glassSurface = Color(0xCCFFF8F2);

  // ── Convenience ColorScheme builder ──────────────────────────────
  static ColorScheme get lightScheme => const ColorScheme(
        brightness: Brightness.light,
        primary: primary,
        onPrimary: onPrimary,
        primaryContainer: primaryContainer,
        onPrimaryContainer: onPrimary,
        secondary: secondary,
        onSecondary: onSecondary,
        tertiary: tertiary,
        onTertiary: onTertiary,
        tertiaryContainer: tertiaryContainer,
        onTertiaryContainer: onTertiary,
        surface: surface,
        onSurface: onSurface,
        onSurfaceVariant: onSurfaceVariant,
        error: tertiary, // reuse conservation-alert red
        onError: onTertiary,
        outline: outlineVariant,
        outlineVariant: outlineVariant,
        surfaceContainerLow: surfaceContainerLow,
        surfaceContainerLowest: surfaceContainerLowest,
      );
}
