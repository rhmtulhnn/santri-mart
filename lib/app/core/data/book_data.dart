import '../model/book_model.dart';

class DataBook {
  static final List<BookModel> recommendedBooks = [
    BookModel(
      title: "Fathul Mu’in",
      image: "assets/images/(1).jpg",
      price: "Rp 89.000",
      condition: "Baru",
      author: "Imam Zainuddin",
      description:
          "Kitab fiqih madzhab Syafi’i yang membahas ibadah harian seperti wudhu, shalat, puasa, zakat, hingga haji. "
          "Disusun dengan bahasa ringkas namun padat, sehingga sering menjadi rujukan di pesantren sebagai kitab fiqih tingkat menengah.",
    ),
    BookModel(
      title: "Adabul Mar'ah",
      image: "assets/images/(2).jpg",
      price: "Rp 57.000",
      condition: "Bekas",
      author: "Imam Nawawi",
      description:
          "Kumpulan hadits shahih yang membahas tentang akhlak, ibadah, keutamaan amal, dan motivasi spiritual. "
          "Kitab ini menjadi salah satu rujukan utama dalam pembinaan karakter di pesantren dan majelis taklim.",
    ),
    BookModel(
      title: "Nashoihul Ibad",
      image: "assets/images/(3).jpg",
      price: "Rp 42.000",
      condition: "Baru",
      author: "Syekh Nawawi",
      description:
          "Kitab berisi nasehat-nasehat tentang keimanan, ketakwaan, dan amal shalih. "
          "Ditulis dengan gaya bahasa yang lembut dan penuh hikmah, sehingga cocok untuk muhasabah diri.",
    ),
  ];

  static final List<BookModel> classicBooks = [
    BookModel(
      title: "Bidayatul Hidayah",
      image: "assets/images/(4).jpg",
      price: "Rp 39.000",
      condition: "Baru",
      author: "Imam Ghazali",
      description:
          "Kitab tasawuf yang mengajarkan adab seorang hamba dalam beribadah, berinteraksi, dan menjaga hati. "
          "Menjadi permulaan bagi penuntut ilmu sebelum mempelajari kitab Ihya’ Ulumuddin.",
    ),
    BookModel(
      title: "Ta'lim Muta'allim",
      image: "assets/images/(5).jpg",
      price: "Rp 33.000",
      condition: "Bekas",
      author: "Syekh Az-Zarnuji",
      description:
          "Kitab klasik tentang adab menuntut ilmu, mulai dari niat, memilih guru, mengatur waktu belajar, hingga etika dalam mengamalkan ilmu. "
          "Sangat populer di pesantren dan menjadi pedoman utama bagi para santri.",
    ),
    BookModel(
      title: "Ihya Ulumuddin",
      image: "assets/images/(6).jpg",
      price: "Rp 120.000",
      condition: "Baru",
      author: "Imam Ghazali",
      description:
          "Karya monumental yang membahas perbaikan hati, akhlak, ibadah, dan kehidupan sosial dari sudut pandang tasawuf. "
          "Kitab ini dikenal sangat mendalam dan menjadi rujukan lintas zaman bagi para ulama.",
    ),
  ];
}
