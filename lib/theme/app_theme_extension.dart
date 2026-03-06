import 'package:flutter/material.dart';

/// Spacing tokens. Access via [AppThemeExtension.spacing] from theme.
@immutable
class AppSpacing {
  const AppSpacing({
    required this.xxs,
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.xxl,
  });

  final double xxs;
  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double xxl;

  /// Default spacing scale (4, 8, 12, 16, 24, 32, 48).
  static const AppSpacing standard = AppSpacing(
    xxs: 4.0,
    xs: 8.0,
    sm: 12.0,
    md: 16.0,
    lg: 24.0,
    xl: 32.0,
    xxl: 48.0,
  );
}

/// App-specific theme tokens. Single source of truth for colors and spacing.
/// Read via `Theme.of(context).extension<AppThemeExtension>()`.
@immutable
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  const AppThemeExtension({
    required this.primary,
    required this.error,
    required this.success,
    required this.warning,
    required this.drawerHeader,
    required this.spacing,
  });

  final Color primary;
  final Color error;
  final Color success;
  final Color warning;
  final Color drawerHeader;
  final AppSpacing spacing;

  /// Light theme tokens. Pass [colorScheme] from ThemeData for consistency.
  factory AppThemeExtension.light(ColorScheme colorScheme) {
    return AppThemeExtension(
      primary: colorScheme.primary,
      error: colorScheme.error,
      success: const Color(0xFF2E7D32),
      warning: const Color(0xFFF57C00),
      drawerHeader: colorScheme.primary,
      spacing: AppSpacing.standard,
    );
  }

  /// Dark theme tokens.
  factory AppThemeExtension.dark(ColorScheme colorScheme) {
    return AppThemeExtension(
      primary: colorScheme.primary,
      error: colorScheme.error,
      success: const Color(0xFF66BB6A),
      warning: const Color(0xFFFFB74D),
      drawerHeader: colorScheme.primary,
      spacing: AppSpacing.standard,
    );
  }

  @override
  AppThemeExtension copyWith({
    Color? primary,
    Color? error,
    Color? success,
    Color? warning,
    Color? drawerHeader,
    AppSpacing? spacing,
  }) {
    return AppThemeExtension(
      primary: primary ?? this.primary,
      error: error ?? this.error,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      drawerHeader: drawerHeader ?? this.drawerHeader,
      spacing: spacing ?? this.spacing,
    );
  }

  @override
  AppThemeExtension lerp(ThemeExtension<AppThemeExtension>? other, double t) {
    if (other is! AppThemeExtension) return this;
    return AppThemeExtension(
      primary: Color.lerp(primary, other.primary, t)!,
      error: Color.lerp(error, other.error, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      drawerHeader: Color.lerp(drawerHeader, other.drawerHeader, t)!,
      spacing: t < 0.5 ? spacing : other.spacing,
    );
  }
}
