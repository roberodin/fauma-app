import 'package:flutter/material.dart';

import 'colors.dart';
import 'typography.dart';

/// Fauma Material 3 theme.
///
/// Implements the "Living Archive" design language: editorial serif
/// headlines, pill-shaped components, whisper shadows, and a warm
/// sandy-cream surface palette.
abstract final class FaumaTheme {
  // ── Shared shape constants ───────────────────────────────────────
  /// Minimum corner radius across the app (2 rem = 32 px).
  static const double _minRadius = 32;

  static final RoundedRectangleBorder _roundedLgShape =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(_minRadius));

  // ── Whisper shadow ───────────────────────────────────────────────
  /// Ambient shadow: onSurface at 6%, 32-64 px blur, 8 px Y offset.
  static List<BoxShadow> get whisperShadow => const [
        BoxShadow(
          color: FaumaColors.whisperShadow,
          blurRadius: 48, // midpoint of 32-64
          offset: Offset(0, 8),
        ),
      ];

  // ── ThemeData ────────────────────────────────────────────────────
  static ThemeData get light {
    final colorScheme = FaumaColors.lightScheme;
    final textTheme = FaumaTypography.textTheme;

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: textTheme,
      scaffoldBackgroundColor: FaumaColors.surface,
      canvasColor: FaumaColors.surface,

      // ── App Bar ────────────────────────────────────────────────
      appBarTheme: AppBarTheme(
        backgroundColor: FaumaColors.surface,
        foregroundColor: FaumaColors.onSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        titleTextStyle: textTheme.titleMedium,
      ),

      // ── Elevated Buttons (primary gradient applied via widget) ─
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: FaumaColors.primary,
          foregroundColor: FaumaColors.onPrimary,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: const StadiumBorder(),
          textStyle: textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // ── Filled Buttons ─────────────────────────────────────────
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: FaumaColors.primary,
          foregroundColor: FaumaColors.onPrimary,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: const StadiumBorder(),
          textStyle: textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // ── Outlined Buttons ───────────────────────────────────────
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: FaumaColors.primary,
          side: const BorderSide(color: FaumaColors.outlineVariant),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: const StadiumBorder(),
          textStyle: textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // ── Text Buttons ───────────────────────────────────────────
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: FaumaColors.primary,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: const StadiumBorder(),
          textStyle: textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // ── Cards — no border, color shift, whisper shadow ─────────
      cardTheme: CardThemeData(
        color: FaumaColors.surfaceContainerLowest,
        elevation: 0,
        shape: _roundedLgShape,
        margin: EdgeInsets.zero,
        shadowColor: Colors.transparent,
      ),

      // ── Chips — pill-shaped ────────────────────────────────────
      chipTheme: ChipThemeData(
        backgroundColor: FaumaColors.surfaceContainerLow,
        selectedColor: FaumaColors.primaryContainer,
        labelStyle: textTheme.labelMedium,
        shape: const StadiumBorder(),
        side: BorderSide.none,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      ),

      // ── Input fields — filled pill, ghost border ───────────────
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: FaumaColors.surfaceContainerLow,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(999),
          borderSide: BorderSide(
            color: FaumaColors.outlineVariant.withValues(alpha: 0.15),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(999),
          borderSide: BorderSide(
            color: FaumaColors.outlineVariant.withValues(alpha: 0.15),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(999),
          borderSide: const BorderSide(
            color: FaumaColors.primary,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(999),
          borderSide: const BorderSide(
            color: FaumaColors.tertiary,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(999),
          borderSide: const BorderSide(
            color: FaumaColors.tertiary,
            width: 1.5,
          ),
        ),
        hintStyle: textTheme.bodyMedium?.copyWith(
          color: FaumaColors.onSurfaceVariant.withValues(alpha: 0.6),
        ),
        labelStyle: textTheme.bodyMedium,
      ),

      // ── Bottom Navigation Bar ──────────────────────────────────
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: FaumaColors.surface,
        selectedItemColor: FaumaColors.primary,
        unselectedItemColor: FaumaColors.onSurfaceVariant,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),

      // ── Navigation Bar (Material 3) ────────────────────────────
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: FaumaColors.surface,
        indicatorColor: FaumaColors.primaryContainer.withValues(alpha: 0.18),
        labelTextStyle: WidgetStatePropertyAll(textTheme.labelMedium),
        elevation: 0,
      ),

      // ── Bottom Sheet ───────────────────────────────────────────
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: FaumaColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(32),
          ),
        ),
        showDragHandle: true,
      ),

      // ── Dialog ─────────────────────────────────────────────────
      dialogTheme: DialogThemeData(
        backgroundColor: FaumaColors.surfaceContainerLowest,
        elevation: 0,
        shape: _roundedLgShape,
      ),

      // ── Floating Action Button ─────────────────────────────────
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: FaumaColors.primary,
        foregroundColor: FaumaColors.onPrimary,
        elevation: 0,
        shape: StadiumBorder(),
      ),

      // ── Divider — use color shift, very subtle ─────────────────
      dividerTheme: DividerThemeData(
        color: FaumaColors.outlineVariant.withValues(alpha: 0.15),
        thickness: 1,
        space: 0,
      ),

      // ── Snackbar ───────────────────────────────────────────────
      snackBarTheme: SnackBarThemeData(
        backgroundColor: FaumaColors.onSurface,
        contentTextStyle: textTheme.bodyMedium?.copyWith(
          color: FaumaColors.surface,
        ),
        shape: const StadiumBorder(),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
