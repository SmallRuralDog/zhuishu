import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';
import 'package:zhuishu/controller/base_controller.dart';

class MessageLogic extends BaseController {
  final List<String> tabValues = [
    '提醒',
    '粉丝',
    '关注',
  ];

  List<RemindItem> remindList = [];
  List<FansItem> fansList = [];

  @override
  void onInit() {
    super.onInit();
    initRemindList();
    initFansList();
  }

  initRemindList() {
    remindList = [
      RemindItem(
        icon: const Icon(
          Icons.message,
          color: Colors.blue,
        ),
        title: "评论",
        mt: 10.0.w,
        unread: 10,
      ),
      RemindItem(
        icon: const Icon(
          Icons.verified,
          color: Colors.orangeAccent,
        ),
        title: "收藏",
      ),
      RemindItem(
        icon: const Icon(
          Icons.thumb_up_alt,
          color: Colors.purpleAccent,
        ),
        title: "推荐",
        unread: 99,
      ),
      RemindItem(
        icon: const Icon(Icons.markunread),
        title: "通知",
        mt: 10.0.w,
      ),
    ];
  }

  initFansList() {
    fansList = [
      FansItem(
        avatar: "https://imgavater.ui.cn/avatar/5/1/0/5/1635015.jpg",
        name: "青峰为隐",
        hasBadge: true,
        isAttention: true,
      ),
      FansItem(
        avatar: "https://imgavater.ui.cn/avatar/9/3/9/0/1140939.jpg",
        name: "Sabaku_no_Gaara",
      ),
      FansItem(
        avatar: "https://imgavater.ui.cn/avatar/small.png",
        name: "Hennng",
        isAttention: true,
      ),
      FansItem(
        avatar: "https://imgavater.ui.cn/avatar/1/7/4/0/930471.jpg",
        name: "Li的绘画笔记",
      ),
      FansItem(
        avatar: "https://imgavater.ui.cn/avatar/5/1/0/5/1635015.jpg",
        name: "青峰为隐",
        hasBadge: true,
        isAttention: true,
      ),
      FansItem(
        avatar: "https://imgavater.ui.cn/avatar/9/3/9/0/1140939.jpg",
        name: "Sabaku_no_Gaara",
      ),
      FansItem(
        avatar: "https://imgavater.ui.cn/avatar/small.png",
        name: "Hennng",
        isAttention: true,
      ),
      FansItem(
        avatar: "https://imgavater.ui.cn/avatar/1/7/4/0/930471.jpg",
        name: "Li的绘画笔记",
      ),
      FansItem(
        avatar: "https://imgavater.ui.cn/avatar/5/1/0/5/1635015.jpg",
        name: "青峰为隐",
        hasBadge: true,
        isAttention: true,
      ),
      FansItem(
        avatar: "https://imgavater.ui.cn/avatar/9/3/9/0/1140939.jpg",
        name: "Sabaku_no_Gaara",
      ),
      FansItem(
        avatar: "https://imgavater.ui.cn/avatar/small.png",
        name: "Hennng",
        isAttention: true,
      ),
      FansItem(
        avatar: "https://imgavater.ui.cn/avatar/1/7/4/0/930471.jpg",
        name: "Li的绘画笔记",
      ),
    ];
  }
}

class RemindItem {
  Widget icon;
  String title;
  int unread;
  double mt;

  RemindItem(
      {required this.icon, required this.title, this.unread = 0, this.mt = 0});
}

class FansItem {
  String avatar;
  String name;
  int post;
  int attention;
  int fans;
  bool isAttention;
  bool hasBadge;

  FansItem({
    required this.avatar,
    required this.name,
    this.post = 0,
    this.attention = 0,
    this.fans = 0,
    this.isAttention = false,
    this.hasBadge = false,
  });
}
