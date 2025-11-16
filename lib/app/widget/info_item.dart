import 'package:flutter/material.dart';
import '../core/theme/app_fonts.dart';
import '../core/theme/app_colors.dart';

class InfoItem extends StatelessWidget {
  final String label;
  final String value;

  const InfoItem({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppFonts.textMedium(
              size: 14,
              color: AppColors.primary,
            ),
          ),
          Text(
            value,
            style: AppFonts.textRegular(
              size: 14,
              color: AppColors.tertiary,
            ),
          ),
        ],
      ),
    );
  }
}
