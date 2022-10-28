import 'package:blog_app/data/api_service/post_api_service.dart';
import 'package:blog_app/data/model/post_list_model.dart';
import 'package:get/get.dart';

class PostListController extends GetxController {
  PostApiService _postApiService = Get.find();
  Rx<PostListState> postListState = PostListState().obs;
  void getAllPosts() {
    postListState.value =
        PostListLoading(); // value is can use as getter and setter
    _postApiService
        .getAllPosts()
        .then((postList) => postListState.value = PostListSuccess(postList))
        .catchError((e) {
      postListState.value = PostListError();
    });
  }
}

class PostListState {}

class PostListLoading extends PostListState {}

class PostListSuccess extends PostListState {
  final List<PostListModel> postList;
  PostListSuccess(this.postList);
}

class PostListError extends PostListState {}
