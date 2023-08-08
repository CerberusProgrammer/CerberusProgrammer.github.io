class Blog {
  final String author;
  final String title;
  final String markdownContent;
  final String? language;
  final String? date;

  Blog({
    required this.title,
    required this.author,
    required this.markdownContent,
    this.language,
    this.date,
  });

  factory Blog.fromJSON(Map<dynamic, dynamic> json) {
    return Blog(
      title: json['title'] ?? '',
      markdownContent: json['markdownContent'] ?? '',
      author: json['author'],
      language: json['language'],
      date: json['date'],
    );
  }
}
