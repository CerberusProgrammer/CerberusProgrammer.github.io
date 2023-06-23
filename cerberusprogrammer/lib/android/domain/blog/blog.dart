class Blog {
  String title;
  String markdownContent;
  String author;

  Blog({
    required this.title,
    required this.markdownContent,
    required this.author,
  });

  factory Blog.fromJson(Map<dynamic, dynamic> json) {
    return Blog(
      title: json['title'],
      markdownContent: json['markdownContent'],
      author: json['author'],
    );
  }
}
