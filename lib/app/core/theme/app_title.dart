import 'package:flutter/material.dart';

import 'app_fonts.dart';
import 'app_colors.dart';

class AppTitle extends StatelessWidget {
  final String heading;
  final String subtitle;
  final TextAlign textAlign;

  const AppTitle({
    super.key,
    required this.heading,
    required this.subtitle,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: textAlign == TextAlign.center
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          textAlign: textAlign,
          style: AppFonts.displayBold(size: 24, color: AppColors.primary),
        ),
        const SizedBox(height: 8.8),
        Text(
          subtitle,
          textAlign: textAlign,
          style: AppFonts.displayRegular(
            size: 15,
            color: AppColors.tertiary,
          ).copyWith(height: 1.6),
        ),
        const SizedBox(height: 28),
      ],
    );
  }
}
