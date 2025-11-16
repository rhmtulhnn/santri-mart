import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_fonts.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(splashControllerProvider, (prev, next) {
      next.whenOrNull(
        data: (_) {
          if (context.mounted) {
            context.go('/login');
          }
        },
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/logo-app.svg',
              width: 86.4,
              height: 86.4,
              fit: BoxFit.cover,
            ),

            SizedBox(height: 8.6),

            Text(
              'Santri Mart',
              style: AppFonts.displayBold(
                size: 26.8,
                color: AppColors.primary,
              ),
            ),

            Text(
              'Islamic Marketplace',
              style: AppFonts.displayRegular(
                size: 12.8,
                color: AppColors.tertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
