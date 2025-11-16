import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_fonts.dart';
import '../../../../widget/book_card.dart';
import '../../../../widget/section_header.dart';
import '../controller/home_controller.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeProvider);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                /// LOCATION
                Text(
                  "Lokasi anda saat ini",
                  style: AppFonts.textRegular(
                    size: 12,
                    color: AppColors.tertiary,
                  ),
                ),
                const SizedBox(height: 6),

                Row(
                  children: [
                    Icon(Icons.location_on, size: 20, color: AppColors.primary),
                    const SizedBox(width: 6),
                    Text(
                      "Tangerang, Indonesia",
                      style: AppFonts.textSemiBold(
                        size: 16,
                        color: AppColors.tertiary,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24.6),

                /// SEARCH BAR
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        decoration: BoxDecoration(
                          color: AppColors.background,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.search, size: 22, color: AppColors.primary),
                            const SizedBox(width: 10),
                            Text(
                              "Cari Buku, Penulis…",
                              style: AppFonts.textRegular(
                                size: 14,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(
                        Icons.tune_rounded,
                        color: AppColors.primary,
                        size: 24,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 28),

                /// REKOMENDASI
                const SectionHeader(title: "Rekomendasi"),
                const SizedBox(height: 24),

                SizedBox(
                  height: 232,
                  child: ListView.separated(
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.recommendedBooks.length,
                    separatorBuilder: (_, _) => const SizedBox(width: 16),
                    itemBuilder: (context, index) {
                      final book = state.recommendedBooks[index];
                      return BookCard(
                        book: book,
                        onTap: () => context.push('/book', extra: book),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 40),

                /// KITAB KLASIK
                const SectionHeader(title: "Kitab Klasik"),
                const SizedBox(height: 24),

                SizedBox(
                  height: 232,
                  child: ListView.separated(
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.classicBooks.length,
                    separatorBuilder: (_, _) => const SizedBox(width: 16),
                    itemBuilder: (context, index) {
                      final book = state.classicBooks[index];
                      return BookCard(
                        book: book,
                        onTap: () => context.push('/book', extra: book),
                      );
                    },
                  ),
                ),
                SizedBox(height: 110,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
