import 'package:blog_app/data/api_service/post_api_service.dart';
import 'package:blog_app/data/model/post_list_model.dart';
import 'package:blog_app/widget/post_list.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  PostApiService _postApiService = PostApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Blog')),
      body: FutureBuilder<List<PostListModel>>(
        future: _postApiService.getAllPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          } else if (snapshot.hasData) {
            List<PostListModel> posts = snapshot.data ?? [];
            return PostListWidget(posts: posts);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
