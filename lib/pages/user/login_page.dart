import 'package:blog/components/custom_elevated_button.dart';
import 'package:blog/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../post/home_page.dart';

class LoginPage extends StatelessWidget {
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
      child: Column(
        children: [
          CustomTextFormfield(hint: 'Username'),
          CustomTextFormfield(hint: 'Password'),
          CustomElevatedButton(
            text: '회원가입',
            pageRoute: () => Get.to(HomePage()),
          ),
        ],
      ),
    );
  }
}
