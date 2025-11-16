class BookModel {
  final String title;
  final String image;
  final String price;
  final String condition;
  final String author;
  final String description;

  BookModel({
    required this.title,
    required this.image,
    required this.price,
    required this.condition,
    this.author = '',
    this.description = '',
  });
}
