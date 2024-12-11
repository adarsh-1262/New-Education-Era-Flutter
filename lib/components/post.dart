class Comment {
  final String userId;
  final String content;
  final DateTime timestamp;

  Comment({required this.userId, required this.content, required this.timestamp});
}

class Post {
  final String id;
  final String userId;
  final String title;
  final String content;
  final DateTime timestamp;
  final List<Comment> comments;

  Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.content,
    required this.timestamp,
    this.comments = const [],
  });
}