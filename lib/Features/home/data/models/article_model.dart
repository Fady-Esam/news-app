class ArticleModel {
  final String? image;
  final String? title;
  final String? subTitle;
  final String? author;
  final String? content;
  final DateTime? publishedAt;

  ArticleModel({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.author,
    required this.content,
    required this.publishedAt,
  });
  factory ArticleModel.fromJson(json) {
    return ArticleModel(
      image: json['urlToImage'],
      title: json['title'],
      subTitle: json['description'],
      author: json['author'],
      content: json['content'],
      publishedAt: DateTime.parse(json['publishedAt']),
    );
  }
}
