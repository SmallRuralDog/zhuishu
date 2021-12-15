import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zhuishu/pages/setting/view.dart';
import 'package:zhuishu/widgets/image.dart';

import 'logic.dart';

class FrameComponent extends StatelessWidget {
  final logic = Get.put(FrameLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          title: const Text("书架"),
          actions: [
            IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () => {Get.to(SettingPage())},
              icon: const Icon(Icons.settings_outlined),
            ),
          ],
        ),
        preferredSize: logic.appBarHeight,
      ),
      body: ListView.builder(
        itemBuilder: _itemBuilder,
        itemCount: 6,
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    if (index == 0) return _buildSign(context);
    if (index == 5) return _buildAddBook(context);

    return _buildItem(context);
  }

  Widget _buildSign(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("签到满 7 天可获得大礼包").fontWeight(FontWeight.bold),
            const Text("查看任务中心").fontSize(12.sp).opacity(0.6).marginOnly(
                  top: 5.w,
                ),
          ],
        ).expanded(),
        ElevatedButton(onPressed: () => {}, child: const Text("签到有礼"))
      ],
    )
        .marginAll(15.w)
        .ripple()
        .gestures(
          onTap: () => {},
        )
        .backgroundColor(logic.colorScheme(context).background)
        .clipRRect(
          all: 10.w,
        )
        .elevation(
          3,
          borderRadius: BorderRadius.circular(10.w),
          shadowColor: logic.colorScheme(context).background,
        )
        .paddingAll(15.w)
        .backgroundColor(logic.colorScheme(context).background);
  }

  Widget _buildAddBook(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.add)
            .opacity(0.6)
            .width(55.w)
            .height(75.w)
            .backgroundColor(logic.colorScheme(context).background)
            .clipRRect(
              all: 5.w,
            )
            .elevation(
              0.6,
              borderRadius: BorderRadius.circular(5.w),
            ),
        const Text("添加小说").fontSize(15.sp).opacity(0.6).paddingOnly(
              left: 15.w,
            ),
      ],
    )
        .paddingSymmetric(
          horizontal: 15.w,
          vertical: 10.w,
        )
        .ripple()
        .gestures(
          onTap: () => {},
        )
        .backgroundColor(logic.colorScheme(context).background);
  }

  Widget _buildItem(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MImage(
          image:
              "https://statics.zhuishushenqi.com/agent/http%3A%2F%2Fimg.1391.com%2Fapi%2Fv1%2Fbookcenter%2Fcover%2F1%2F3397565%2F3397565_66120002852e4857bc0f414ad614c9e6.jpg",
          width: 55.w,
          height: 75.w,
          radius: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("我有一座超级海岛")
                        .fontSize(15.sp)
                        .fontWeight(FontWeight.bold),
                    const Text("指尖风月")
                        .fontSize(11.sp)
                        .marginOnly(
                          top: 5.w,
                        )
                        .opacity(0.5),
                  ],
                ).expanded(),
                SizedBox(
                  width: 40.w,
                  height: 40.w,
                  child: GFProgressBar(
                    percentage: 0.4,
                    radius: 30.w,
                    circleWidth: 2.w,
                    type: GFProgressType.circular,
                    child: const Text("99%").fontSize(8.sp).opacity(0.6),
                  ),
                ),
              ],
            ),
            const Text("6小时前：第8章 一招会喷火的拳法").fontSize(11.sp).opacity(0.5),
          ],
        )
            .paddingOnly(
              left: 10.w,
            )
            .expanded(),
      ],
    )
        .height(75.w)
        .paddingSymmetric(
          horizontal: 15.w,
          vertical: 10.w,
        )
        .ripple()
        .gestures(
          onTap: () => {},
        )
        .backgroundColor(logic.colorScheme(context).background);
  }
}
