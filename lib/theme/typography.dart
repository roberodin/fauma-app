import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

/// Fauma typographic scale.
///
/// Serif headlines (Newsreader) paired with sans-serif body (Inter)
/// create the editorial "nature periodical" tension described in the
/// design system.
abstract final class FaumaTypography {
  // ── Base font families ───────────────────────────────────────────
  static TextStyle get _newsreader => GoogleFonts.newsreader(
        color: FaumaColors.onSurface,
      );

  static TextStyle get _inter => GoogleFonts.inter(
        color: FaumaColors.onSurface,
      );

  // ── Scale ────────────────────────────────────────────────────────
  // rem values converted to logical pixels (1 rem = 16 px):
  //   3.5  rem = 56 px
  //   1.75 rem = 28 px
  //   1.125 rem = 18 px
  //   0.875 rem = 14 px
  //   0.75  rem = 12 px

  static TextStyle get displayLarge => _newsreader.copyWith(
        fontSize: 56,
        fontWeight: FontWeight.w400,
        height: 1.12, // tight leading for hero stats
        letterSpacing: -0.5,
      );

  static TextStyle get headlineMedium => _newsreader.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        height: 1.29,
        letterSpacing: 0,
      );

  static TextStyle get titleMedium => _inter.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w600, // semi-bold
        height: 1.33,
        letterSpacing: 0.15,
      );

  static TextStyle get bodyMedium => _inter.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.43,
        letterSpacing: 0.25,
      );

  static TextStyle get labelMedium => _inter.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.33,
        letterSpacing: 0.5,
      );

  // ── Full TextTheme ───────────────────────────────────────────────
  static TextTheme get textTheme => TextTheme(
        displayLarge: displayLarge,
        displayMedium: _newsreader.copyWith(
          fontSize: 44,
          fontWeight: FontWeight.w400,
          height: 1.16,
          letterSpacing: -0.25,
        ),
        displaySmall: _newsreader.copyWith(
          fontSize: 36,
          fontWeight: FontWeight.w400,
          height: 1.22,
        ),
        headlineLarge: _newsreader.copyWith(
          fontSize: 32,
          fontWeight: FontWeight.w400,
          height: 1.25,
        ),
        headlineMedium: headlineMedium,
        headlineSmall: _newsreader.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w400,
          height: 1.33,
        ),
        titleLarge: _inter.copyWith(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          height: 1.27,
          letterSpacing: 0,
        ),
        titleMedium: titleMedium,
        titleSmall: _inter.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          height: 1.43,
          letterSpacing: 0.1,
        ),
        bodyLarge: _inter.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 1.5,
          letterSpacing: 0.5,
        ),
        bodyMedium: bodyMedium,
        bodySmall: _inter.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          height: 1.33,
          letterSpacing: 0.4,
        ),
        labelLarge: _inter.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          height: 1.43,
          letterSpacing: 0.1,
        ),
        labelMedium: labelMedium,
        labelSmall: _inter.copyWith(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          height: 1.45,
          letterSpacing: 0.5,
        ),
      );
}
