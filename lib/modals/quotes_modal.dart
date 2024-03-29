//Modal class   =>  Structure
class Quote {
  //Attributes
  final String quote;
  final String author;
  final String category;
  int likes = 0;
  bool isLiked = false;

  //Parameterized constructor
  Quote({
    required this.quote,
    required this.author,
    required this.category,
  });

  //Factory constructor:  Map =>  Current Class Object
  factory Quote.fromMap({required Map data}) => Quote(
        quote: data['quote'],
        author: data['author'],
        category: data['category'],
      );

  // Object => Map
  Map<String, dynamic> get toMap => {
        'quote': quote,
        'author': author,
        'category': category,
        'likes': likes,
        'isLiked': isLiked,
      };
}
