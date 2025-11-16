import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/data/book_data.dart';
import '../../../../core/model/book_model.dart';
import '../../../../core/theme/app_buttons.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_fonts.dart';
import '../../../../widget/divider.dart';
import '../../../../widget/info_item.dart';
import '../../../../widget/recommended_item.dart';
import '../controller/detail_controller.dart';

class DetailScreen extends ConsumerWidget {
  final BookModel book;
  const DetailScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailState = ref.watch(detailControllerProvider);
    final controller = ref.read(detailControllerProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // IMAGE
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    book.image,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 22),

              // TITLE
              Center(
                child: Text(
                  book.title,
                  textAlign: TextAlign.center,
                  style: AppFonts.displaySemiBold(
                    size: 24,
                    color: AppColors.primary,
                  ),
                ),
              ),

              const SizedBox(height: 6),

              // PRICE
              Center(
                child: Text(
                  "Price: ${book.price}",
                  style: AppFonts.textRegular(
                    size: 16,
                    color: AppColors.tertiary,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // BUY BUTTON
              Center(
                child: ElevatedButton(
                  style: AppButtons.stylePrimary.copyWith(
                    minimumSize: const WidgetStatePropertyAll(Size(48, 48)),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                  onPressed: detailState.isLoading
                      ? null
                      : () async {
                          await controller.buyBook(book);
                        },
                  child: detailState.isLoading
                      ? const SizedBox(
                          height: 22,
                          width: 22,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : Text(
                          "Beli Sekarang • ${book.condition}",
                          style: AppFonts.textMedium(
                            size: 16,
                            color: AppColors.white,
                          ),
                        ),
                ),
              ),

              SoftDivider(),

              // DESCRIPTION
              Text(
                "Sinopsis Kitab",
                style: AppFonts.displaySemiBold(
                  size: 18,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 12),

              Text(
                book.description,
                textAlign: TextAlign.justify,
                style: AppFonts.textRegular(
                  size: 14.6,
                  color: AppColors.tertiary,
                ).copyWith(height: 1.8),
              ),

              SoftDivider(),

              // AUTHOR
              Text(
                "Tentang Penulis",
                style: AppFonts.displaySemiBold(
                  size: 18,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 18),

              Row(
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: AppColors.background,
                    child: Icon(
                      Icons.person_rounded,
                      size: 28,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      book.author,
                      style: AppFonts.textMedium(
                        size: 15,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),

              SoftDivider(),

              // BOOK INFO
              Text(
                "Informasi Buku",
                style: AppFonts.displaySemiBold(
                  size: 18,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 14),

              const InfoItem(label: "Penerbit", value: "Gramedia Pustaka"),
              const InfoItem(label: "Tanggal Terbit", value: "12 Agustus 2024"),
              const InfoItem(label: "Bahasa", value: "Indonesia"),
              const InfoItem(label: "Halaman", value: "320 Halaman,"),
              const InfoItem(label: "ISBN", value: "978-602-xxx-xxx"),

              SoftDivider(),

              // REVIEW
              Text(
                "Review",
                style: AppFonts.displaySemiBold(
                  size: 18,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 12),

              const Text(
                "Belum ada review",
                style: TextStyle(color: Colors.grey),
              ),

              SoftDivider(),

              // RECOMMENDED
              Text(
                "Rekomendasi Buku",
                style: AppFonts.displaySemiBold(
                  size: 18,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 20),

              Column(
                children: DataBook.recommendedBooks.map((buku) {
                  return RecommendedItem(
                    book: buku,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailScreen(book: buku),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
