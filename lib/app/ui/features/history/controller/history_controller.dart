import 'package:flutter_riverpod/legacy.dart';
import '../../../../core/model/transaction_model.dart';

final historyControllerProvider =
StateNotifierProvider<HistoryController, List<TransactionModel>>(
      (ref) => HistoryController(),
);

class HistoryController extends StateNotifier<List<TransactionModel>> {
  HistoryController() : super(_dummyData);

  // Dummy data untuk contoh
  static final List<TransactionModel> _dummyData = [
    TransactionModel(
      title: "Kitab Adabul Mar'ah",
      date: "12 Jan 2025",
      price: "Rp 63.700",
      isPaid: true,
    ),
    TransactionModel(
      title: "Fiqih Sunnah",
      date: "07 Jan 2025",
      price: "Rp 47.250",
      isPaid: true,
    ),
    TransactionModel(
      title: "Sirah Nabawiyah",
      date: "05 Jan 2025",
      price: "Rp 71.680",
      isPaid: true,
    ),
  ];

  // Tambah transaksi
  void addTransaction(TransactionModel trx) {
    state = [...state, trx];
  }
}
