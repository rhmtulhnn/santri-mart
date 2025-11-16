import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import '../core/theme/app_fonts.dart';

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppFonts.displaySemiBold(
            size: 18.8,
            color: AppColors.primary,
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Text(
            "Semua",
            style: AppFonts.textMedium(
              size: 14,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
