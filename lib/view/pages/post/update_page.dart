import 'package:blog/controller/post_controller.dart';
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
  final _title = TextEditingController();
  final _content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final PostController p = Get.find();
    _title.text = "${p.post.value.title}";
    _content.text = "${p.post.value.content}";
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              CustomTextFormfield(
                controller: _title,
                hint: "title",
                funValidator: validateTitle(),
                // value: "${p.post.value.title}",
              ),
              CustomTextArea(
                controller: _content,
                hint: "content",
                funValidator: validateContent(),
                // value: "${p.post.value.content}",
              ),
              CustomElevatedButton(
                text: '글 수정하기',
                funPageRoute: () async{
                  if (_formKey.currentState!.validate()) {
                    await p.updateById(p.post.value.id ?? 0, _title.text, _content.text);
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
