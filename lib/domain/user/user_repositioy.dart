import 'package:blog/controller/dto/CMRespDto.dart';
import 'package:blog/controller/dto/LoginReqDto.dart';
import 'package:blog/domain/user/user.dart';
import 'package:blog/domain/user/user_provider.dart';
import 'package:blog/util/jwt.dart';
import 'package:get/get_connect/http/src/response/response.dart';

// 통신을 호출해서 응답되는 데이터를 예쁘게 가공
class UserRepository {
  final UserProvider _userProvider = UserProvider();

  Future<User> login(String username, String password) async {
    LoginResDto loginResDto = LoginResDto(username, password);
    Response response = await _userProvider.login(loginResDto.toJson());
    dynamic headers = response.headers;
    dynamic body = response.body;
    // print("사용자 정보 : $body");

    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if (cmRespDto.code == 1) {
      User principal = User.fromJson(cmRespDto.data);

      String token = headers["authorization"];

      jwtToken = token;
      print("jwtToken : $jwtToken");

      return principal;
    } else {
      // List<Post>? hello = [];
      return User();
    }


    // if(headers["authorization"] == null){
    //   return "-1";
    // }
    // else{
    //   String token = headers["authorization"];
    //   return token;
    // }
  }
}