class Blog {
  final String title;
  final String subtitle;
  final List<String> categories;
  final DateTime dateTime;
  final String author;
  final String content;

  Blog({
    required this.title,
    required this.subtitle,
    required this.categories,
    required this.dateTime,
    required this.author,
    required this.content,
  });
}
