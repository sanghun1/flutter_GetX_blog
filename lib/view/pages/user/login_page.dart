import 'package:blog/controller/user_controller.dart';
import 'package:blog/domain/user/user_repositioy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/validator_util.dart';
import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';
import '../post/home_page.dart';
import 'join_page.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final UserController u = Get.put(UserController());

  final _username = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              height: 200,
              child: Text(
                "로그인 페이지 ${u.isLogin}",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _loginForm(),
          ],
        ),
      ),
    );
  }

  Widget _loginForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormfield(
            controller: _username,
            hint: 'Username',
            funValidator: validateUsername(),
          ),
          CustomTextFormfield(
            controller: _password,
            hint: 'Password',
            funValidator: validatePassword(),
          ),
          CustomElevatedButton(
            text: '로그인',
            funPageRoute: () async {
              if (_formKey.currentState!.validate()) {
                // Get.to(HomePage());
                // UserRepository u = UserRepository();
                String token = await u.login(_username.text.trim(), _password.text.trim());
                if (token != "-1") {
                  Get.to(HomePage());
                }
                else{
                  Get.snackbar("로그인 시도", "로그인 실패");
                }
              }
            },
          ),
          TextButton(
            onPressed: () {
              Get.to(JoinPage());
            },
            child: Text("아직 회원가입이 안되어 있나요?"),
          ),
        ],
      ),
    );
  }
}
