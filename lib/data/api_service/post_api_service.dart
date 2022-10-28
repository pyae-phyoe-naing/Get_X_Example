import 'package:blog_app/data/model/post_list_model.dart';
import 'package:dio/dio.dart';

class PostApiService {
  static const _baseUrl = "https://rubylearner.herokuapp.com";
  Dio _dio = Dio();
  Future<List<PostListModel>> getAllPosts() async {
    var result = await _dio.get("$_baseUrl/posts");
    List postList = result.data as List;
    return postList.map((post) => PostListModel.fromJson(post)).toList();
  }
}
