class Blog {
  final String author;
  final String title;
  final String markdownContent;

  Blog({
    required this.title,
    required this.author,
    required this.markdownContent,
  });

  factory Blog.fromJSON(Map<dynamic, dynamic> json) {
    return Blog(
      title: json['title'] ?? '',
      markdownContent: json['markdownContent'] ?? '',
      author: json['author'],
    );
  }
}
