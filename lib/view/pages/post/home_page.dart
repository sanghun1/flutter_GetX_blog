import 'package:blog/controller/post_controller.dart';
import 'package:blog/controller/user_controller.dart';
import 'package:blog/size.dart';
import 'package:blog/view/pages/post/write_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/post/post.dart';
import '../user/login_page.dart';
import '../user/user_info.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // put 없으면 만들고, 있으면 찾기
    UserController u = Get.find();
    // 객체 생성(create) onInit 함수 실행 (initialize)
    PostController p = Get.put(PostController());
    // p.findAll();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (scaffoldKey.currentState!.isDrawerOpen) {
            scaffoldKey.currentState!.openDrawer();
          } else {
            scaffoldKey.currentState!.openDrawer();
          }
        },
        child: Icon(Icons.code),
      ),
      drawer: _navigation(context),
      appBar: AppBar(
        title: Text("${u.isLogin}"),
      ),
      body: Obx(() => RefreshIndicator(
            key: refreshKey,
            onRefresh: () async {
              await p.findAll();
            },
            child: ListView.separated(
              itemCount: p.posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () async {
                    await p.findById(p.posts[index].id!);
                    Get.to(() => DetailPage(p.posts[index].id), arguments: "arguments 속성 테스트");
                  },
                  title: Text("${p.posts[index].title}"),
                  leading: Text("${p.posts[index].id}"),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
          )),
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
                Get.to(() => WritePage());
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
                // Navigator.pop(context);
                scaffoldKey.currentState!.openDrawer();
                Get.to(() => UserInfo());
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
