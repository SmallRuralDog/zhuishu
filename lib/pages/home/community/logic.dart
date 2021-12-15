import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zhuishu/controller/base_controller.dart';

class CommunityLogic extends BaseController {
  List<GridMenuItem> gridMenuList = [];

  TabController tabController =
      TabController(length: 3, vsync: ScrollableState());

  @override
  void onInit() {
    super.onInit();
    initGridMenu();
  }

  initGridMenu() {
    gridMenuList = [
      GridMenuItem(icon: "images/娱乐.png", title: "综合讨论"),
      GridMenuItem(icon: "images/播放.png", title: "精彩书评"),
      GridMenuItem(icon: "images/日历.png", title: "原创写作"),
      GridMenuItem(icon: "images/波动.png", title: "电子竞技"),
      GridMenuItem(icon: "images/礼物.png", title: "活动福利"),
      GridMenuItem(icon: "images/聊天.png", title: "女生蜜语"),
      GridMenuItem(icon: "images/钱.png", title: "二次元"),
      GridMenuItem(icon: "images/鞋子.png", title: "网文江湖"),
      GridMenuItem(icon: "images/音乐.png", title: "大话历史"),
    ];
  }
}

class GridMenuItem {
  String icon;
  String title;

  GridMenuItem({required this.icon, required this.title});
}
