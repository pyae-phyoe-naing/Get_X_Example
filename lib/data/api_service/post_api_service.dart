import 'package:blog_app/data/model/add_post_model.dart';
import 'package:blog_app/data/model/post_detail_model.dart';
import 'package:blog_app/data/model/post_list_model.dart';
import 'package:dio/dio.dart';

class PostApiService {
  static const baseUrl = "https://rubylearner.herokuapp.com";
  Dio _dio = Dio();
  Future<List<PostListModel>> getAllPosts() async {
    var result = await _dio.get("$baseUrl/posts");
    List postList = result.data as List;
    return postList.map((post) => PostListModel.fromJson(post)).toList();
  }

  Future<List<PostDetailModel>> getPost(int id) async {
    var result = await _dio.get("$baseUrl/post?id=$id");
    List postList = result.data as List;
    return postList.map((post) => PostDetailModel.fromJson(post)).toList();
  }

  Future<AddPostModel> addPost(
      {required String title,
      required String body,
      required FormData ?photo}) async {
    var result =
        await _dio.post('$baseUrl/post?title=$title&body=$body', data: photo);
    AddPostModel addPostModel = AddPostModel.fromJson(result.data);
    return addPostModel;
  }
}
