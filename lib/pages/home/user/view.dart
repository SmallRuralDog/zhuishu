import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zhuishu/pages/setting/view.dart';
import 'package:zhuishu/widgets/image.dart';

import 'logic.dart';

class UserComponent extends StatelessWidget {
  final logic = Get.put(UserLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          title: const Text('我的'),
          leading: IconButton(
            icon: const Icon(Icons.flip_outlined),
            onPressed: () => {},
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings_outlined),
              onPressed: () => {
                Get.to(SettingPage()),
              },
            ),
          ],
        ),
        preferredSize: logic.appBarHeight,
      ),
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    return ListView(
      children: [
        <Widget>[
          _buildUserInfo(context),
          _buildUserData(context),
          _buildUserVip(context),
        ].toColumn().backgroundColor(logic.colorScheme(context).background),
        _buildGridMenu(context),
        _buildColumnMenu(context),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget _buildUserInfo(BuildContext context) {
    return Row(
      children: [
        MAvatar(
          size: 50.w,
          image:
              "https://statics.zhuishushenqi.com/avatar/90/b7/90b7c549cd228de7511787ddb513efbb",
        ),
        <Widget>[
          [
            const Text(
              "挥手﹑凝淡墨",
              maxLines: 1,
            ),
            const Text(
              "已实名认证",
              maxLines: 1,
            )
                .fontSize(11.sp)
                .textColor(logic.colorScheme(context).background)
                .paddingSymmetric(
                  horizontal: 6.w,
                  vertical: 2.w,
                )
                .backgroundLinearGradient(
                    colors: [const Color(0xffF9DDA9), const Color(0xffeec892)])
                .clipRRect(
                  topRight: 5.w,
                  bottomRight: 5.w,
                  bottomLeft: 5.w,
                )
                .marginOnly(
                  left: 8.w,
                ),
          ].toRow(),
          const Text("邀请码：99351456")
              .fontSize(12.sp)
              .marginOnly(
                top: 5.w,
              )
              .opacity(0.5),
        ]
            .toColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
            )
            .paddingOnly(
              left: 15.w,
            )
            .alignment(Alignment.topLeft)
            .expanded(),
        const Icon(
          Icons.qr_code_outlined,
        ).opacity(0.4).ripple().gestures(
              onTap: () => {},
            ),
      ],
    ).paddingAll(
      15.w,
    );
  }

  Widget _buildUserVip(BuildContext context) {
    return <Widget>[
      const Text("我的VIP")
          .fontWeight(FontWeight.bold)
          .textColor(const Color(0xffE9C591)),
      const Icon(
        Icons.navigate_next_outlined,
        color: Color(0xffE9C591),
      )
    ]
        .toRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        )
        .paddingSymmetric(
          horizontal: 15.w,
          vertical: 15.w,
        )
        .ripple()
        .gestures(
          onTap: () => {},
        )
        .backgroundColor(logic.colorScheme(context).primary);
  }

  Widget _buildUserData(BuildContext context) {
    List<UserDataItem> data = [
      UserDataItem(num: "18800", title: "追书币"),
      UserDataItem(num: "9800", title: "追书券"),
      UserDataItem(num: "14.02", title: "零钱(元)"),
      UserDataItem(num: "454", title: "积分"),
    ];

    return data
        .map(
          (e) => <Widget>[
            Text(
              e.num,
              style: GoogleFonts.jetBrainsMono(),
            )
                .fontSize(16.sp)
                .fontWeight(
                  FontWeight.bold,
                )
                .marginOnly(
                  bottom: 5.w,
                ),
            Text(e.title).fontSize(12.sp).opacity(0.6),
          ]
              .toColumn()
              .width((375 / 4).w)
              .paddingSymmetric(
                vertical: 10.w,
              )
              .ripple()
              .gestures(
                onTap: () => {},
              ),
        )
        .toList()
        .toRow(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
        );
  }

  Widget _buildGridMenu(BuildContext context) {
    Color background = logic.colorScheme(context).background;
    return [
      const Text("常用功能")
          .fontSize(16)
          .fontWeight(FontWeight.bold)
          .opacity(0.8)
          .paddingSymmetric(
            vertical: 10.w,
            horizontal: 15.w,
          )
          .backgroundColor(background)
          .marginOnly(
            top: 15.w,
          ),
      GridView.count(
        crossAxisCount: 4,
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
                width: 40.w,
                height: 40.w,
              ).marginOnly(bottom: 8.w),
              Text(
                e.title,
                maxLines: 1,
              ).fontSize(12.sp).opacity(0.6)
            ],
          ).ripple().gestures(onTap: () => {});
        }).toList(),
      ).backgroundColor(background),
    ].toColumn(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start);
  }

  Widget _buildColumnMenu(BuildContext context) {
    Color background = logic.colorScheme(context).background;
    return [
      const Text("常用功能")
          .fontSize(16)
          .fontWeight(FontWeight.bold)
          .opacity(0.8)
          .paddingSymmetric(
            vertical: 10.w,
            horizontal: 15.w,
          )
          .backgroundColor(background)
          .marginOnly(
            top: 15.w,
          ),
      logic.columnMenuList
          .map((e) {
            return ListTile(
              title: [
                Image.asset(
                  e.icon,
                  width: 30.w,
                  height: 30.w,
                ).marginOnly(
                  right: 15.w,
                ),
                Text(e.title).fontSize(12.sp).opacity(0.6).expanded(),
              ].toRow(),
              trailing: const Icon(Icons.navigate_next_outlined).opacity(0.6),
            ).ripple().gestures(onTap: () => {}).backgroundColor(background);
          })
          .toList()
          .toColumn(),
    ].toColumn(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start);
  }
}
