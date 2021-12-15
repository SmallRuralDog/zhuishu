import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zhuishu/widgets/divider.dart';
import 'package:zhuishu/widgets/image.dart';

import 'logic.dart';

class CommunityComponent extends StatelessWidget {
  final logic = Get.put(CommunityLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          title: const Text("社区"),
          actions: [
            IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.add_circle_outline),
            ),
          ],
        ),
        preferredSize: logic.appBarHeight,
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      physics: const BouncingScrollPhysics(),
      itemBuilder: _buildItem,
      separatorBuilder: (BuildContext context, int index) {
        return const MDivider();
      },
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    if (index == 0) return _buildGrid(context);

    if (index == 1) {
      return TabBar(
        controller: logic.tabController,
        labelPadding: EdgeInsets.symmetric(vertical: 12.w),
        indicatorSize: TabBarIndicatorSize.label,
        tabs: [
          const Text("热门话题").fontSize(14.sp),
          const Text("我的关注").fontSize(14.sp),
          const Text("我的发布").fontSize(14.sp),
        ],
      )
          .ripple()
          .backgroundColor(logic.colorScheme(context).background)
          .marginOnly(
            top: 10.w,
          );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const MAvatar(
              image: "https://imgavater.ui.cn/avatar/9/3/9/0/1140939.jpg",
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("蓦然回首在一瞬间").marginOnly(
                  bottom: 3.w,
                ),
                const Text("综合讨论")
                    .fontSize(10.sp)
                    .paddingSymmetric(
                      vertical: 1.w,
                      horizontal: 5.w,
                    )
                    .opacity(0.5),
              ],
            )
                .paddingOnly(
                  left: 15.w,
                )
                .expanded(),
            OutlinedButton(
              onPressed: () => {},
              child: const Text("关注").fontSize(12.sp),
            ),
          ],
        ),
        const Text("我们都有光明的未来")
            .fontSize(15.sp)
            .fontWeight(FontWeight.bold)
            .marginOnly(
              top: 10.w,
              bottom: 5.w,
            ),
        const Text(
          "我在控制自己的占有欲不会伤害到你，因为我爱你。如果你喜欢这样的我，我愿意永远做你眼中的乖小孩",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ).opacity(0.6),
        index % 3 == 0 ? _buildBookItem(context) : Container(),
        Row(
          children: [
            const Text("6,999 人浏览 · 128 条评论")
                .fontSize(11.sp)
                .opacity(0.4)
                .expanded(),
            const Text("2021/12/12").fontSize(11.sp).opacity(0.4),
          ],
        ).marginOnly(
          top: 10.w,
        ),
      ],
    )
        .paddingSymmetric(
          horizontal: 15.w,
          vertical: 15.w,
        )
        .ripple()
        .gestures(
          onTap: () => {},
        )
        .backgroundColor(logic.colorScheme(context).background);
  }

  Widget _buildGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 5,
      crossAxisSpacing: 1.5,
      mainAxisSpacing: 1.5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: logic.gridMenuList.map((e) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              e.icon,
              width: 25.w,
              height: 25.w,
            ).marginOnly(bottom: 8.w),
            Text(
              e.title,
              maxLines: 1,
            ).fontSize(12.sp).opacity(0.6)
          ],
        ).ripple().clipRRect(all: 10.w).gestures(onTap: () => {});
      }).toList(),
    )
        .paddingOnly(
          bottom: 10.w,
          top: 10.w,
        )
        .backgroundColor(logic.colorScheme(context).background);
  }

  Widget _buildBookItem(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MImage(
          image:
              "https://statics.zhuishushenqi.com/agent/http%3A%2F%2Fimg.1391.com%2Fapi%2Fv1%2Fbookcenter%2Fcover%2F1%2F3397565%2F3397565_66120002852e4857bc0f414ad614c9e6.jpg",
          width: 62.w,
          height: 82.w,
          radius: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("我有一座超级海岛").fontSize(15.sp).fontWeight(FontWeight.bold),
            const Text("指尖风月")
                .fontSize(12.sp)
                .opacity(0.6)
                .marginOnly(top: 10.w),
            GFRating(
              onChanged: (value) => {},
              value: 4.1,
              size: 20.w,
            ),
          ],
        )
            .paddingOnly(
              left: 10.w,
            )
            .expanded(),
      ],
    )
        .height(82.w)
        .paddingAll(10.w)
        .ripple()
        .gestures(
          onTap: () => {},
        )
        .backgroundColor(
            logic.themeData(context).scaffoldBackgroundColor.withAlpha(200))
        .clipRRect(
          all: 10.w,
        )
        .marginOnly(top: 10.w);
  }
}
