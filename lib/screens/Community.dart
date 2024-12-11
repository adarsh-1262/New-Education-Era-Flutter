import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learnly/controller/queriesController.dart';
class ForumPage extends StatelessWidget {
  final ForumController forumController = Get.put(ForumController());
  final TextEditingController postTitleController = TextEditingController();
  final TextEditingController postContentController = TextEditingController();
  final TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Community Forum')),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return ListView.builder(
                itemCount: forumController.posts.length,
                itemBuilder: (context, index) {
                  final post = forumController.posts[index];
                  return Card(
                    margin: EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(post.title, style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text(post.content),
                          SizedBox(height: 8),
                          Text('Comments:', style: TextStyle(fontWeight: FontWeight.bold)),
                          ...post.comments.map((comment) => ListTile(
                                title: Text(comment.content),
                                subtitle: Text('by ${comment.userId}'),
                              )),
                          TextField(
                            controller: commentController,
                            decoration: InputDecoration(
                              labelText: 'Add a comment',
                              suffixIcon: IconButton(
                                icon: Icon(Icons.send),
                                onPressed: () {
                                  if (commentController.text.isNotEmpty) {
                                    forumController.addComment(post.id, 'User 1', commentController.text);
                                    commentController.clear();
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: postTitleController,
                    decoration: InputDecoration(labelText: 'Post Title'),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: postContentController,
                    decoration: InputDecoration(labelText: 'Post Content'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (postTitleController.text.isNotEmpty && postContentController.text.isNotEmpty) {
                      forumController.addPost('User 1', postTitleController.text, postContentController.text);
                      postTitleController.clear();
                      postContentController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}