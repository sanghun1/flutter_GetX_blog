import 'package:blog/components/custom_elevated_button.dart';
import 'package:blog/components/custom_text_form_field.dart';
import 'package:blog/util/validator_util.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';
import 'package:get/get.dart';

import 'login_page.dart';

class JoinPage extends StatelessWidget {
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
          CustomTextFormfield(
            hint: 'Email',
            funValidator: validateEmail(),
          ),
          CustomElevatedButton(
            text: '회원가입',
            funPageRoute: () {
              if (_formKey.currentState!.validate()) {
                Get.to(LoginPage());
              }
            },
          ),
          TextButton(
            onPressed: () {
              Get.to(LoginPage());
            },
            child: Text("로그인 페이지로 이동"),
          )
        ],
      ),
    );
  }
}
