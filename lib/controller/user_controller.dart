import 'package:blog/domain/user/user_repositioy.dart';
import 'package:blog/util/jwt.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserRepository _userRepository = UserRepository();

  Future<void> login(String username, String password) async {
    String token = await _userRepository.login(username, password);
    jwtToken = token;
    print("jwtToken : $jwtToken");
  }
}
