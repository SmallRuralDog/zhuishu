import 'package:zhuishu/controller/base_controller.dart';
import 'package:zhuishu/pages/home/community/logic.dart';

class UserLogic extends BaseController {
  List<MenuItem> gridMenuList = [];
  List<MenuItem> columnMenuList = [];

  @override
  void onInit() {
    super.onInit();
    initMenu();
  }

  initMenu() {
    gridMenuList = [
      MenuItem(icon: "images/liwu.png", title: "礼物"),
      MenuItem(icon: "images/VIP.png", title: "会员专享"),
      MenuItem(icon: "images/火热.png", title: "原创写作"),
      MenuItem(icon: "images/关注.png", title: "电子竞技"),
    ];

    columnMenuList = [
      MenuItem(icon: "images/省钱.png", title: "我的账户"),
      MenuItem(icon: "images/袋子.png", title: "我的VIp"),
      MenuItem(icon: "images/日记本.png", title: "任务中心"),
      MenuItem(icon: "images/心跳.png", title: "邀请好友"),
      MenuItem(icon: "images/游戏.png", title: "游戏中心"),
    ];
  }
}

class UserDataItem {
  String num;
  String title;

  UserDataItem({required this.num, required this.title});
}

class MenuItem {
  String icon;
  String title;

  MenuItem({required this.icon, required this.title});
}
