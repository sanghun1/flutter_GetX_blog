
import 'package:blog/controller/user_controller.dart';
import 'package:blog/size.dart';
import 'package:blog/view/pages/post/write_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../user/login_page.dart';
import '../user/user_info.dart';
import 'detail_page.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // put 없으면 만들고, 있으면 찾기
    UserController u = Get.find();

    return Scaffold(
      drawer: _navigation(context),
      appBar: AppBar(
        title: Text("${u.isLogin}"),
      ),
      body: ListView.separated(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Get.to(DetailPage(index), arguments: "arguments 속성 테스트");
            },
            title: Text("제목1"),
            leading: Text("1"),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }

  Widget _navigation(BuildContext context) {
    UserController u = Get.find();
    return Container(

      width: getDrawerWidth(context),
      height: double.infinity,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {
                Get.to(WritePage());
              },
              child: Text(
                "글쓰기",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
            Divider(),
            TextButton(
              onPressed: () {
                Get.to(UserInfo());
              },
              child: Text(
                "회원정보보기",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
            Divider(),
            TextButton(
              onPressed: () {
                u.logout();
                Get.to(LoginPage());
              },
              child: Text(
                "로그아웃",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
