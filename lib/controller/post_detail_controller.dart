import 'package:blog_app/data/api_service/post_api_service.dart';
import 'package:blog_app/data/model/post_detail_model.dart';
import 'package:get/get.dart';

class PostDetailController extends GetxController {
  PostApiService _postApiService = Get.find();
  Rx<PostDetailState> postDetailState = PostDetailState().obs;

  void getPost(int id) {
    postDetailState.value = PostDetailLoading();
    _postApiService.getPost(id).then((postList) {
      if (postList.isNotEmpty) {
        postDetailState.value = PostDetailSuccess(postList[0]);
      }
    }).catchError((onError) {
      postDetailState.value = PostDetailError();
    });
  }
}

class PostDetailState {}

class PostDetailLoading extends PostDetailState {}

class PostDetailSuccess extends PostDetailState {
  final PostDetailModel post;
  PostDetailSuccess(this.post);
}

class PostDetailError extends PostDetailState {}
