import 'package:blog/controller/dto/LoginReqDto.dart';
import 'package:blog/domain/user/user_provider.dart';
import 'package:get/get_connect/http/src/response/response.dart';

// 통신을 호출해서 응답되는 데이터를 예쁘게 가공
class UserRepository{
  final UserProvider _userProvider = UserProvider();

  Future<String> login(String username, String password) async {
    LoginResDto loginResDto = LoginResDto(username, password);
    Response response = await _userProvider.login(loginResDto.toJson());
    dynamic headers = response.headers;
    String token = headers["authorization"];
    return token;
    // print(headers);
    // return "";
  }
}