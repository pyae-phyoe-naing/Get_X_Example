import 'package:blog_app/data/model/post_list_model.dart';
import 'package:flutter/material.dart';

class PostListWidget extends StatelessWidget {
  final List<PostListModel> posts;
  const PostListWidget({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 10, top: 10),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(posts[index].title ?? ''),
            ),
        ),
        );
      },
    );
  }
}
