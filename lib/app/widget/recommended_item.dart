import 'package:flutter/material.dart';
import '../core/model/book_model.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_fonts.dart';

class RecommendedItem extends StatelessWidget {
  final BookModel book;
  final VoidCallback onTap;

  const RecommendedItem({
    super.key,
    required this.book,
    required this.onTap,
  });

  Color _conditionColor(String condition) {
    return condition.toLowerCase() == "baru"
        ? AppColors.primary
        : Colors.orange;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(20),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    book.image,
                    width: 64,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppFonts.textMedium(
                          size: 15,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        book.author,
                        style: AppFonts.textRegular(
                          size: 13,
                          color: AppColors.tertiary,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Rp ${book.price}",
                        style: AppFonts.textMedium(
                          size: 14,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Positioned(
              right: 0,
              top: 8.6,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 4.6),
                decoration: BoxDecoration(
                  color: _conditionColor(book.condition).withAlpha(40),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  book.condition,
                  style: AppFonts.textMedium(
                    size: 12,
                    color: _conditionColor(book.condition),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
