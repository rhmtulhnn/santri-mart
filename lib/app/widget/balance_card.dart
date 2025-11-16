import 'package:flutter/material.dart';

import '../core/theme/app_fonts.dart';
import '../core/theme/app_colors.dart';

class BalanceCard extends StatelessWidget {
  final String balance;

  const BalanceCard({
    super.key,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary,
            AppColors.secondary,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.shade200.withAlpha(90),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -6,
            bottom: -6,
            child: Icon(
              Icons.account_balance_wallet_outlined,
              size: 90,
              color: Colors.white.withAlpha(40),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.wallet,
                    size: 20,
                    color: Colors.white.withAlpha(220),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    "Your Balance",
                    style: AppFonts.displayRegular(
                      size: 14,
                      color: Colors.white.withAlpha(220),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 6),

              Text(
                balance,
                style: AppFonts.displayBold(
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
