
import 'package:blog/util/validator_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';
import '../../components/custom_textarea.dart';
import 'home_page.dart';

class WritePage extends StatelessWidget {
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
              ),
              CustomTextArea(
                hint: "content",
                funValidator: validateContent(),
              ),
              CustomElevatedButton(
                text: '글쓰기',
                funPageRoute: () {
                  if (_formKey.currentState!.validate()) {
                    Get.off(HomePage());
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
