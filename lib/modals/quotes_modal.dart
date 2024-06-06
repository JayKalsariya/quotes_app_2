class Quote {
  int id;
  String text;
  String author;
  String category;

  Quote({
    required this.id,
    required this.text,
    required this.author,
    required this.category,
  });

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        id: json["id"],
        text: json["text"],
        author: json["author"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
        "author": author,
        "category": category,
      };
}
