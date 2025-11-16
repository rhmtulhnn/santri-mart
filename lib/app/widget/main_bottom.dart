import 'package:flutter/material.dart';

class MainBottom extends StatelessWidget {
  final List<Widget> childrenWrap;
  final Color backgroundNavbar;
  final double? topPositionNavbar;
  final double leftPositionNavbar;
  final double rightPositionNavbar;
  final double bottomPositionNavbar;

  const MainBottom({
    super.key,
    required this.childrenWrap,
    required this.backgroundNavbar,
    this.topPositionNavbar,
    required this.leftPositionNavbar,
    required this.rightPositionNavbar,
    required this.bottomPositionNavbar,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.only(
          left: 60.0,
          right: 60.0,
          bottom: 80.0,
        ),

        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 20.0,
        ),

        width: double.infinity,
        height: 60.0,
        decoration: BoxDecoration(
          color: backgroundNavbar.withAlpha(228),
          borderRadius: BorderRadius.circular(30),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: childrenWrap,
        ),
      ),
    );
  }
}
