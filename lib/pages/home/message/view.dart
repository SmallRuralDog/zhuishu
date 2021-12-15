import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/getwidget.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zhuishu/widgets/divider.dart';
import 'package:zhuishu/widgets/image.dart';

import 'logic.dart';
import 'm_comment/view.dart';

class MessageComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MessageComponent();
}

class _MessageComponent extends State<MessageComponent> {
  final logic = Get.put(MessageLogic());
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: logic.tabValues.length,
      vsync: ScrollableState(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          title: const Text("消息"),
        ),
        preferredSize: logic.appBarHeight,
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return <Widget>[
      TabBar(
        tabs: logic.tabValues.map((e) => Text(e)).toList(),
        controller: _controller,
        labelPadding: EdgeInsets.symmetric(vertical: 10.w),
        indicatorSize: TabBarIndicatorSize.label,
      ).ripple().backgroundColor(logic.colorScheme(context).background),
      Expanded(
        child: TabBarView(
          children: [
            RemindView(),
            FansView(),
            AttentionView(),
          ],
          controller: _controller,
        ),
      )
    ].toColumn();
  }
}

class RemindView extends GetView<MessageLogic> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: controller.remindList.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: _buildItem,
      separatorBuilder: (BuildContext context, int index) {
        return const MDivider();
      },
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    RemindItem remindItem = controller.remindList[index];

    return GFListTile(
      avatar: remindItem.icon,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(remindItem.title),
          remindItem.unread > 0
              ? GFBadge(
                  text: remindItem.unread.toString(),
                )
              : Container(),
        ],
      ),
      icon: const Icon(Icons.navigate_next),
      onTap: () {
        Get.to(MCommentPage(title: remindItem.title));
      },
    ).ripple().backgroundColor(controller.colorScheme(context).background).marginOnly(top: remindItem.mt);
  }
}

class FansView extends GetView<MessageLogic> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.fansList.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: _buildItem,
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    FansItem fansItem = controller.fansList[index];

    return GFListTile(
      avatar: MAvatar(image: fansItem.avatar),
      title: Text(fansItem.name).fontSize(15.sp),
      description:
          Text("动态${fansItem.post} 关注${fansItem.attention} 粉丝${fansItem.fans}")
              .fontSize(12.sp)
              .marginOnly(top: 3.w)
              .opacity(0.5),
      icon: ElevatedButton(
        onPressed: () {},
        child: const Text("关注").fontSize(12.sp),
      ),
    ).backgroundColor(controller.colorScheme(context).background).marginOnly(
          top: index > 0 ? controller.get1Px() : 10.w,
          bottom: index == controller.fansList.length - 1 ? 10.w : 0,
        );
  }
}

class AttentionView extends GetView<MessageLogic> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.fansList.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: _buildItem,
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    FansItem fansItem = controller.fansList[index];

    return GFListTile(
      avatar: MAvatar(image: fansItem.avatar),
      title: Text(fansItem.name).fontSize(15.sp),
      description:
          Text("动态${fansItem.post} 关注${fansItem.attention} 粉丝${fansItem.fans}")
              .fontSize(12.sp)
              .marginOnly(top: 3.w)
              .opacity(0.5),
      icon: ElevatedButton(
        onPressed: null,
        child: const Text("互关").fontSize(12.sp),
      ),
    ).backgroundColor(controller.colorScheme(context).background).marginOnly(
          top: index > 0 ? controller.get1Px() : 10.w,
          bottom: index == controller.fansList.length - 1 ? 10.w : 0,
        );
  }
}
