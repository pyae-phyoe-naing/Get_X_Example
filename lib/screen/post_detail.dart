import 'package:blog_app/controller/post_detail_controller.dart';
import 'package:blog_app/data/model/post_detail_model.dart';
import 'package:blog_app/shimmer/post_detail_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/api_service/post_api_service.dart';

class PostDetail extends StatefulWidget {
  final int id;
  final String title;
  PostDetail({Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  PostDetailController postDetailController = Get.put(PostDetailController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    postDetailController.getPost(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Obx(() {
        PostDetailState state = postDetailController.postDetailState.value;
        if (state is PostDetailLoading) {
          return const PostDetailShimmer();
        } else if (state is PostDetailSuccess) {
          PostDetailModel post = state.post;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(post.title ?? ''),
                ),
              ),
              const Divider(),
              Center(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(post.body ?? ''),
              )),
              const Divider(),
              post.photo == null ? const SizedBox() : Image.network('${PostApiService.baseUrl}/${post.photo}',height: 300,)
            ],
          );
        } else if (state is PostDetailError) {
          return const Center(
            child: Text('Error'),
          );
        }
        return Container();
      }),
    );
  }
}
