import 'package:blog/components/custom_elevated_button.dart';
import 'package:blog/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../util/validator_util.dart';

import '../post/home_page.dart';
import 'join_page.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

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
                "로그인 페이지",
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
            hint: 'Username',
            funValidator: validateUsername(),
          ),
          CustomTextFormfield(
            hint: 'Password',
            funValidator: validatePassword(),
          ),
          CustomElevatedButton(
            text: '로그인',
            funPageRoute: () {
              if (_formKey.currentState!.validate()) {
                Get.to(HomePage());
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
