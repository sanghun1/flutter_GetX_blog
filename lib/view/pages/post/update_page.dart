import 'package:blog/util/validator_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';
import '../../components/custom_textarea.dart';
import 'detail_page.dart';
import 'home_page.dart';

class UpdatePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              CustomTextFormfield(
                hint: "title",
                funValidator: validateTitle(),
                value: "제목1~" * 2,
              ),
              CustomTextArea(
                hint: "content",
                funValidator: validateContent(),
                value: "내용1" * 20,
              ),
              CustomElevatedButton(
                text: '글 수정하기',
                funPageRoute: () {
                  if (_formKey.currentState!.validate()) {
                    Get.back();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
