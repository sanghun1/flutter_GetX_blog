import 'package:blog/util/jwt.dart';
import 'package:get/get.dart';

const host = "http://192.168.35.23:8080";

class PostProvider extends GetConnect {
  // Promise (데이터 약속)
  Future<Response> findAll() => get("$host/post", headers: {"Authorization" : jwtToken ?? ""});

  Future<Response> findById(int id) => get("$host/post/$id", headers: {"Authorization" : jwtToken ?? ""});
}