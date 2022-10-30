import 'package:blog_app/controller/add_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  final AddPostController _addPostController = Get.put(AddPostController());
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Post'),
        centerTitle: true,
      ),
      body: Obx(() {
        AddPostState state = _addPostController.addPostState.value;
        if (state is AddPostLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AddPostSuccess) {
          return Center(
            child: Text(state.addPostResponse.result ?? ''),
          );
        } else if (state is AddPostError) {
          return const Center(
            child: Text('Error'),
          );
        }
        return Form(
          key: _key,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(children: [
              const Text('Enter Title'),
              TextFormField(),
              const Divider(),
              const Text('Enter Content'),
              TextFormField(
                maxLines: 5,
                minLines: 2,
              ),
              const Divider(),
              IconButton(onPressed: () {}, icon: const Icon(Icons.photo))
            ]),
          ),
        );
      }),
    );
  }
}
