import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_fonts.dart';
import '../../../../widget/balance_card.dart';
import '../../../../widget/transaction_item.dart';
import '../controller/history_controller.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyList = ref.watch(historyControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          "Transaction History",
          style: AppFonts.displayBold(size: 18),
        ),
        backgroundColor: AppColors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),

      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        children: [
          const BalanceCard(balance: "Rp 320.000"),
          const SizedBox(height: 26),

          Text(
            "Recent Transactions",
            style: AppFonts.displayBold(size: 16),
          ),
          const SizedBox(height: 14),

          // DATA RIVERPOD
          ...historyList.map((trx) => TransactionItem(trx: trx)),
        ],
      ),
    );
  }
}
