import 'package:blog/components/custom_elevated_button.dart';
import 'package:blog/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_page.dart';

class JoinPage extends StatelessWidget {
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
                "회원가입 페이지",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _joinForm(),
          ],
        ),
      ),
    );
  }

  Widget _joinForm() {
    return Form(
      child: Column(
        children: [
          CustomTextFormfield(hint: 'Username'),
          CustomTextFormfield(hint: 'Password'),
          CustomTextFormfield(hint: 'Email'),
          CustomElevatedButton(
            text: '회원가입',
            pageRoute: () => Get.to(LoginPage()),
          ),
        ],
      ),
    );
  }
}
