import 'package:blog_app/controller/post_list_controller.dart';
import 'package:blog_app/data/api_service/post_api_service.dart';
import 'package:blog_app/data/model/add_post_model.dart';
import 'package:blog_app/widget/bottom_nav.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as D;

class AddPostController extends GetxController {
  final PostApiService _postApiService = Get.find();
  final PostListController _postListController = Get.find();

  Rx<AddPostState> addPostState = AddPostState().obs;
  RxDouble percentage = 0.0.obs;
  void addPost(
      {required String title,
      required String body,
      required D.FormData? photo}) {
    addPostState.value = AddPostLoading();
    _postApiService
        .addPost(
            title: title,
            body: body,
            photo: photo,
            addPostProgress: (send, data) {
              percentage.value = send / data;
            })
        .then((addPostResponse) {
      addPostState.value = AddPostSuccess(addPostResponse);
      Future.delayed(const Duration(seconds: 1)).then((value) {
        Get.off(const BottonNavWidget());
        _postListController.getAllPosts();
        addPostState.value = AddPostState();
      });
    }).catchError((e) {
      addPostState.value = AddPostError();
    });
  }
}

class AddPostState {}

class AddPostLoading extends AddPostState {}

class AddPostSuccess extends AddPostState {
  final AddPostModel addPostResponse;

  AddPostSuccess(this.addPostResponse);
}

class AddPostError extends AddPostState {}
