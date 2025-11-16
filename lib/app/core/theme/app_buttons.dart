import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppButtons {
  /// --- PRIMARY BUTTON STYLE ---
  static final ButtonStyle stylePrimary = ElevatedButton.styleFrom(
    minimumSize: const Size(280, 50),
    backgroundColor: AppColors.primary,
    foregroundColor: Colors.white,
    elevation: 2,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(16.0),
      ),
    ),
  );

  /// --- SECONDARY BUTTON STYLE (TERTIARY COLOR) ---
  static final ButtonStyle styleSecondary = ElevatedButton.styleFrom(
    minimumSize: const Size(280, 50),
    backgroundColor: AppColors.tertiary,
    foregroundColor: Colors.white,
    elevation: 2,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(16.0),
      ),
    ),
  );
}
