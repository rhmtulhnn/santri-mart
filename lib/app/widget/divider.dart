import 'package:flutter/material.dart';

class SoftDivider extends StatelessWidget {
  final double spacing;

  const SoftDivider({super.key, this.spacing = 16.2});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: spacing),
        Container(
          height: 1,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
        ),
        SizedBox(height: spacing),
      ],
    );
  }
}
