import 'package:blog_app/controller/post_list_controller.dart';
import 'package:blog_app/data/model/post_list_model.dart';
import 'package:blog_app/widget/post_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final PostListController _postListController = Get.put(PostListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Blog')),
        body: Obx(() {
          PostListState state = _postListController.postListState.value;
          if (state is PostListLoading) {
            return ListView(children: [
              for (var i = 0; i < 15; i++)
                Shimmer.fromColors(
                    baseColor: const Color.fromARGB(255, 197, 196, 196),
                    highlightColor: Colors.white,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      height: 50,
                      color: const Color.fromARGB(255, 197, 196, 196),
                    ))
            ]);
          } else if (state is PostListSuccess) {
            List<PostListModel> posts = state.postList;
            return PostListWidget(posts: posts);
          } else if (state is PostListError) {
            return const Center(
              child: Text('Error'),
            );
          }
          return Container();
        }));
  }
}
