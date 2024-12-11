import 'package:get/get.dart';
import 'package:learnly/components/post.dart';

class ForumController extends GetxController {
  // List of posts
  var posts = <Post>[Post(
      id: '1',
      userId: 'user1',
      title: 'First Post',
      content: 'This is the content of the first post.',
      timestamp: DateTime.now(),
    ),
    Post(
      id: '2',
      userId: 'user2',
      title: 'Second Post',
      content: 'This is the content of the second post.',
      timestamp: DateTime.now(),
    ),
  
].obs;

  // Add a new post
  void addPost(String userId, String title, String content) {
    final newPost = Post(
      id: DateTime.now().toString(), // Generate a unique ID
      userId: userId,
      title: title,
      content: content,
      timestamp: DateTime.now(),
    );
    posts.add(newPost);
  }

  // Add a comment to a post
  void addComment(String postId, String userId, String content) {
    final postIndex = posts.indexWhere((post) => post.id == postId);
    if (postIndex != -1) {
      final comment = Comment(
        userId: userId,
        content: content,
        timestamp: DateTime.now(),
      );
      posts[postIndex].comments.add(comment);
      // Update the posts list to notify listeners
      posts.refresh();
    }
  }

  // Get all posts
  List<Post> getAllPosts() {
    return posts.toList();
  }

  // Get a specific post by ID
  Post? getPostById(String postId) {
    return posts.firstWhereOrNull((post) => post.id == postId);
  }

  // Delete a post
  void deletePost(String postId) {
    posts.removeWhere((post) => post.id == postId);
  }

  // Delete a comment from a post
  void deleteComment(String postId, String commentContent) {
    final postIndex = posts.indexWhere((post) => post.id == postId);
    if (postIndex != -1) {
      posts[postIndex].comments.removeWhere((comment) => comment.content == commentContent);
      // Update the posts list to notify listeners
      posts.refresh();
    }
  }
}