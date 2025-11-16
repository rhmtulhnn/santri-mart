import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:santri_mart/app/widget/main_bottom.dart';
import '../../../core/theme/app_colors.dart';
import '../controler/main_controller.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomIndex = ref.watch(mainControllerProvider);
    final controller = ref.read(mainControllerProvider.notifier);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.background,
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.bottomCenter,
        children: [
          SafeArea(child: controller.tabViews[bottomIndex]),

          // Bottom Navbar
          MainBottom(
            leftPositionNavbar: 40.0,
            rightPositionNavbar: 40.0,
            bottomPositionNavbar: 40.0,
            backgroundNavbar: AppColors.background,
            childrenWrap: List.generate(
              controller.svgIconBottomNavbar.length,
              (index) => IconButton(
                onPressed: () => controller.changeIndex(index),
                splashRadius: 26.0,
                splashColor: Colors.white,
                highlightColor: Colors.white,
                icon: SvgPicture.asset(
                  controller.svgIconBottomNavbar[index],
                  colorFilter: ColorFilter.mode(
                    bottomIndex == index
                        ? AppColors.primary
                        : AppColors.tertiary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
