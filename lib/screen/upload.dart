import 'dart:io';

import 'package:blog_app/controller/add_post_controller.dart';
import 'package:dio/dio.dart' as D;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  final AddPostController _addPostController = Get.put(AddPostController());
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final ImagePicker _imagePicker = ImagePicker();
  File? _image;
  String? _title, _body;
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
          return Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  'Uploading ... ${(_addPostController.percentage * 100).toInt()}'),
              const Divider(),
              CircularProgressIndicator(
                  value: _addPostController.percentage * 100),
            ],
          ));
        } else if (state is AddPostError) {
          return const Center(
            child: Text('Error'),
          );
        } else if (state is AddPostSuccess) {
          return Center(
            child: Text(state.addPostResponse.result ?? ''),
          );
        }
        return Form(
          key: _key,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(children: [
              const Text('Enter Title'),
              TextFormField(
                onSaved: (title) {
                  _title = title;
                },
                validator: (title) {
                  if (title == null || title.isEmpty) {
                    return 'Enter Title';
                  }
                },
              ),
              const Divider(),
              const Text('Enter Content'),
              TextFormField(
                maxLines: 5,
                minLines: 2,
                onSaved: (body) {
                  _body = body;
                },
                validator: (body) {
                  if (body == null || body.isEmpty) {
                    return 'Enter Content';
                  }
                },
              ),
              const Divider(),
              IconButton(
                  onPressed: () async {
                    final XFile? file = await _imagePicker.pickImage(
                        source: ImageSource.gallery);
                    if (file != null) {
                      setState(() {
                        _image = File(file.path);
                      });
                    }
                  },
                  icon: const Icon(Icons.photo)),
              (_image == null)
                  ? const Text('Choose Image')
                  : Image.file(
                      _image!,
                      height: 200,
                    ),
              ElevatedButton(
                  onPressed: () async {
                    D.MultipartFile? multipartFile;
                    D.FormData? formData;
                    if (_image != null) {
                      multipartFile = await D.MultipartFile.fromFile(
                          _image!.path,
                          filename: 'image.png');
                    }
                    _key.currentState!.save();
                    if (_key.currentState != null &&
                        _key.currentState!.validate()) {
                      if (multipartFile != null) {
                        formData = D.FormData.fromMap({'photo': multipartFile});
                      }
                      _addPostController.addPost(
                          title: _title ?? '',
                          body: _body ?? '',
                          photo: formData);
                    }
                  },
                  child: const Text('Save Post'))
            ]),
          ),
        );
      }),
    );
  }
}
