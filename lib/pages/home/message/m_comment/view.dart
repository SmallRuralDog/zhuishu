import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zhuishu/widgets/divider.dart';
import 'package:zhuishu/widgets/image.dart';

import 'logic.dart';

class MCommentPage extends StatelessWidget {
  String title;

  final logic = Get.put(MCommentLogic());

  MCommentPage({Key? key, this.title = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          title: Text(title),
        ),
        preferredSize: logic.appBarHeight,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ListView.separated(
      itemCount: 50,
      physics: const BouncingScrollPhysics(),
      itemBuilder: _buildItem,
      separatorBuilder: (BuildContext context, int index) {
        return const MDivider();
      },
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MAvatar(
              image: "https://imgavater.ui.cn/avatar/9/3/9/0/1140939.jpg",
              size: 40.w,
            ),
            <Widget>[
              <Widget>[
                const Text("饭偶像下").fontWeight(FontWeight.bold).expanded(),
                const Text("2021/10/10").fontSize(12.sp).opacity(0.3),
              ].toRow(),
              const Text(
                "削苹果的时候心里打赌，如果苹果皮不断那我们就会在一起，于是小心翼翼的削了此生第一个完成的苹果皮，但还是没能跟你在一起，那些年偷偷做尽了幼稚的事",
              ).opacity(0.5).marginOnly(
                    top: 5.w,
                  ),
            ]
                .toColumn()
                .paddingOnly(
                  left: 15.w,
                )
                .expanded(),
          ],
        ),
        const Text(
          "#热门话题# 或许不再频繁追问爱意时我们才会好过一点",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        )
            .opacity(0.5)
            .paddingSymmetric(
              horizontal: 15.w,
              vertical: 12.w,
            )
            .borderRadius(all: 10.w)
            .backgroundColor(logic.themeData(context).scaffoldBackgroundColor)
            .clipRRect(all: 10.w)
            .marginOnly(
              top: 15.w,
            ),
      ],
    )
        .paddingSymmetric(
          horizontal: 15.w,
          vertical: 10.w,
        )
        .backgroundColor(logic.colorScheme(context).background);
  }
}
