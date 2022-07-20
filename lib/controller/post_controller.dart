import 'package:blog/domain/post/post_repositioy.dart';
import 'package:get/get.dart';

import '../domain/post/post.dart';

class PostController extends GetxController{
  final PostRepository _postRepository = PostRepository();
  final posts = <Post>[].obs;
  final post = Post().obs;


  @override
  void onInit() {
    super.onInit();
    findAll();
  }

  Future<void> findAll() async{
    List<Post> posts = await _postRepository.findAll();
    this.posts.value = posts;
  }

  Future<void> findById(int id) async {
    Post post = await _postRepository.findById(id);
    this.post.value = post;
  }
}