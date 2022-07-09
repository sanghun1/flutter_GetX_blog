import 'package:blog/view/pages/post/update_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page.dart';

class DetailPage extends StatelessWidget {
  final int id;

  const DetailPage(this.id);

  @override
  Widget build(BuildContext context) {
    // String data = Get.arguments;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "글 제목",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
              Divider(),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.off(HomePage());
                    },
                    child: Text("삭제"),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(UpdatePage());
                    },
                    child: Text("수정"),
                  )
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Text("글 내용"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
