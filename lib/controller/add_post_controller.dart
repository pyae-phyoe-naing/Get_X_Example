import 'package:blog_app/data/api_service/post_api_service.dart';
import 'package:blog_app/data/model/add_post_model.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as D;

class AddPostController extends GetxController {
  final PostApiService _postApiService = Get.find();
  Rx<AddPostState> addPostState = AddPostState().obs;
  
  void AddPost({required String title,required String body,required D.FormData photo}) {
    addPostState.value = AddPostLoading();
    _postApiService.addPost(title: title, body: body, photo: photo).then((addPostResponse){
         addPostState.value = AddPostSuccess(addPostResponse);
    }).catchError((e){
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
