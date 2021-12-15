import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zhuishu/controller/base_controller.dart';
import 'package:zhuishu/pages/home/community/view.dart';
import 'package:zhuishu/pages/home/frame/view.dart';
import 'package:zhuishu/pages/home/index/view.dart';
import 'package:zhuishu/pages/home/message/view.dart';
import 'package:zhuishu/pages/home/user/view.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  BaseController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBody() {
    return PageView(
      controller: controller.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        FrameComponent(),
        IndexComponent(),
        CommunityComponent(),
        MessageComponent(),
        UserComponent(),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return Obx(
      () => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: controller.onTap,
        currentIndex: controller.currentIndex.value,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book,
            ),
            label: "书架",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu_book,
            ),
            label: "书城",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_library,
            ),
            label: "社区",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
            ),
            label: "消息",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
            ),
            label: "我的",
          ),
        ],
      ),
    );
  }
}
