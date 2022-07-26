import 'package:blog/controller/post_controller.dart';
import 'package:blog/controller/user_controller.dart';
import 'package:blog/view/pages/post/update_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page.dart';

class DetailPage extends StatelessWidget {
  final int? id;

  const DetailPage(this.id);

  @override
  Widget build(BuildContext context) {
    // String data = Get.arguments;

    UserController u = Get.find();
    PostController p = Get.find();
    print("로그인 유저 아이디 : ${u.principal.value.id}");

    return Scaffold(
      appBar: AppBar(
        title: Text("게시글 아이디 : $id, 로그인 상태 : ${u.isLogin}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Obx(() => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${p.post.value.title}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                  Divider(),
                  u.principal.value.id == p.post.value.user!.id
                      ? Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                p.deleteById(p.post.value.id!);
                                Get.off(() => HomePage());
                              },
                              child: Text("삭제"),
                            ),
                            SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                                Get.to(() => UpdatePage());
                              },
                              child: Text("수정"),
                            )
                          ],
                        )
                      : SizedBox(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text("${p.post.value.content}"),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
