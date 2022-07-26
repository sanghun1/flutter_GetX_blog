import 'package:blog/controller/dto/CMRespDto.dart';
import 'package:blog/controller/dto/LoginReqDto.dart';
import 'package:blog/controller/dto/SaveOrUpdateReqDto.dart';
import 'package:blog/domain/post/post.dart';
import 'package:blog/domain/post/post_provider.dart';
import 'package:blog/util/convert_utf8.dart';
import 'package:get/get_connect/http/src/response/response.dart';

// 통신을 호출해서 응답되는 데이터를 예쁘게 가공
class PostRepository{
  final PostProvider _postProvider = PostProvider();

  Future<Post> save(String title, String content) async {
    SaveOrUpdateReqDto saveReqDto = SaveOrUpdateReqDto(title, content);
    Response response = await _postProvider.save(saveReqDto.toJson());
    dynamic body = response.body;
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if(cmRespDto.code == 1){
      print("글쓰기 성공");
      Post post = Post.fromJson(cmRespDto.data);
      return post;
    }
    else{
      print("글쓰기 실패");
      return Post();
    }
  }

  Future<Post> updateById(int id, String title, String content) async {
    SaveOrUpdateReqDto updateReqDto = SaveOrUpdateReqDto(title, content);
    Response response = await _postProvider.updateById(id, updateReqDto.toJson());
    dynamic body = response.body;
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if(cmRespDto.code == 1){
      print("수정 성공");
      Post post = Post.fromJson(cmRespDto.data);
      return post;
    }
    else{
      print("수정 실패");
      return Post();
    }
  }

  Future<int> deleteById(int id) async {
    Response response = await _postProvider.deleteById(id);
    dynamic body = response.body;
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    return cmRespDto.code ?? -1;
  }

  Future<Post> findById(int id) async {
    Response response = await _postProvider.findById(id);
    dynamic body = response.body;
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if(cmRespDto.code == 1){
      Post post = Post.fromJson(cmRespDto.data);
      return post;
    }else{
      return Post();
    }
  }

  Future<List<Post>> findAll() async {
    Response response = await _postProvider.findAll();
    dynamic body = response.body;
    // dynamic convertBody = body;
    CMRespDto cmRespDto = CMRespDto.fromJson(body);
    // print(cmRespDto.code);
    // print(cmRespDto.msg);
    // print(cmRespDto.data.runtimeType);

    if(cmRespDto.code == 1){
      List<dynamic> temp = cmRespDto.data;
      List<Post> posts = temp.map((post) => Post.fromJson(post)).toList();
      return posts;
    }else{
      // List<Post>? hello = [];
      return <Post>[];
    }
  }
}