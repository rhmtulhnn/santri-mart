import 'package:flutter/material.dart';

class AppColors {
  /// --- BASIC COLORS ---
  static const Color black       = Color(0xFF000000);
  static const Color white       = Color(0xFFFFFFFF);
  static const Color transparent = Colors.transparent;

  /// --- BRAND PRIMARY COLORS ---
  static const Color primary   = Color(0xFF073A7A);
  static const Color secondary = Color(0xFF4E8CE0);

  /// --- SUPPORTING COLORS ---
  static const Color tertiary   = Color(0xFF576875);
  static const Color quaternary = Color(0xFF322846);
  static const Color background = Color(0xFFF0F2FA);

  /// --- STATUS COLORS ---
  static const Color success = Colors.green;
  static const Color error   = Colors.red;
  static const Color warning = Colors.orange;
}

class AppGradients {
  /// --- PRIMARY GRADIENT ---
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [AppColors.primary, AppColors.secondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// --- SOFT GRADIENT ---
  static const LinearGradient softGradient = LinearGradient(
    colors: [AppColors.primary, AppColors.tertiary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// --- ALT GRADIENT ---
  static const LinearGradient altGradient = LinearGradient(
    colors: [AppColors.secondary, AppColors.background],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

/// --- CONTEXT EXTENSION ---
extension ContextBackground on BuildContext {
  Color get adaptiveBackground {
    return Theme.of(this).brightness == Brightness.dark
        ? AppColors.black
        : AppColors.background;
  }
}
