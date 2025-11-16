import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_fonts.dart';
import '../core/model/transaction_model.dart';

class TransactionItem extends StatelessWidget {
  final TransactionModel trx;

  const TransactionItem({super.key, required this.trx});

  Color _statusColor(bool isPaid) {
    return isPaid ? Colors.green : Colors.orange;
  }

  @override
  Widget build(BuildContext context) {
    final Color statusColor = _statusColor(trx.isPaid);

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(15),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primary.withAlpha(18),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  Icons.payments_rounded,   // icon payment yang modern
                  color: AppColors.primary,
                  size: 26,
                ),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trx.title,
                      style: AppFonts.displayBold(size: 15),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      trx.date,
                      style: AppFonts.textRegular(
                        size: 12,
                        color: AppColors.tertiary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      trx.price,
                      style: AppFonts.displayBold(size: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4.6),
              decoration: BoxDecoration(
                color: statusColor.withAlpha(28),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                trx.isPaid ? "Paid" : "Pending",
                style: AppFonts.displayBold(size: 12.6, color: statusColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
