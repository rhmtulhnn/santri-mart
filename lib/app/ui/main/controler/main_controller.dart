import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../features/history/screen/history_screen.dart';
import '../../features/home/screen/home_screen.dart';
import '../../features/profile/screen/profile_screen.dart';

class MainController extends StateNotifier<int> {
  MainController() : super(0);

  final List<String> svgIconBottomNavbar = [
    'assets/svg/home.svg',
    'assets/svg/history.svg',
    'assets/svg/profile.svg',
  ];

  final List<Widget> tabViews = [
    HomeScreen(),
    HistoryScreen(),
    ProfileScreen(),
  ];

  void changeIndex(int index) {
    state = index;
  }
}

// Provider utama
final mainControllerProvider =
StateNotifierProvider<MainController, int>((ref) {
  return MainController();
});
