import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/model/book_model.dart';

final detailControllerProvider =
StateNotifierProvider<DetailController, DetailState>(
      (ref) => DetailController(),
);

class DetailState {
  final bool isLoading;

  DetailState({this.isLoading = false});

  DetailState copyWith({bool? isLoading}) {
    return DetailState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class DetailController extends StateNotifier<DetailState> {
  DetailController() : super(DetailState());

  Future<void> buyBook(BookModel book) async {
    state = state.copyWith(isLoading: true);

    await Future.delayed(const Duration(seconds: 1)); // simulasi proses

    state = state.copyWith(isLoading: false);

    // nanti bisa dipindah ke checkout / keranjang
    if (kDebugMode) {
      print("Membeli buku: ${book.title}");
    }
  }
}
