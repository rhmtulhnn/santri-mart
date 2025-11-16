import 'package:flutter_riverpod/legacy.dart';

import '../../../../core/data/book_data.dart';
import '../../../../core/model/book_model.dart';

class HomeController extends StateNotifier<HomeState> {
  HomeController() : super(HomeState.initial()) {
    loadData();
  }

  void loadData() {
    state = state.copyWith(
      recommendedBooks: DataBook.recommendedBooks,
      classicBooks: DataBook.classicBooks,
    );
  }
}

final homeProvider =
StateNotifierProvider<HomeController, HomeState>((ref) {
  return HomeController();
});

class HomeState {
  final List<BookModel> recommendedBooks;
  final List<BookModel> classicBooks;

  HomeState({
    required this.recommendedBooks,
    required this.classicBooks,
  });

  factory HomeState.initial() => HomeState(
    recommendedBooks: [],
    classicBooks: [],
  );

  HomeState copyWith({
    List<BookModel>? recommendedBooks,
    List<BookModel>? classicBooks,
  }) {
    return HomeState(
      recommendedBooks: recommendedBooks ?? this.recommendedBooks,
      classicBooks: classicBooks ?? this.classicBooks,
    );
  }
}
