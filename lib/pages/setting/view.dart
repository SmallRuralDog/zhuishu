import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zhuishu/controller/base_controller.dart';
import 'package:zhuishu/pages/setting/theme_popup_menu.dart';
import 'package:zhuishu/widgets/divider.dart';

import 'logic.dart';

class SettingPage extends StatelessWidget {
  final logic = Get.put(SettingLogic());
  BaseController baseController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          title: const Text('设置'),
        ),
        preferredSize: logic.appBarHeight,
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Obx(
      () => ListView(
        padding: EdgeInsets.only(top: 10.w),
        children: <Widget>[
          ListTile(
            title: FlexThemeModeSwitch(
              title: const Text("主题模式"),
              labelSystem: "系统",
              labelDark: "黑夜",
              labelLight: "白天",
              height: 10.w,
              width: 10.w,
              onThemeModeChanged: baseController.onThemeModeChanged,
              flexSchemeData:
                  FlexColor.schemesList[baseController.schemeIndex.value],
              themeMode: baseController.themeMode.value,
            ).marginOnly(
              bottom: 3.w,
              top: 3.w,
            ),
          )
              .ripple()
              .backgroundColor(baseController.colorScheme(context).background),
          const MDivider(),
          ThemePopupMenu(),
          const MDivider(),
          ListTile(
            title: const Text('深色导航栏'),
            trailing: Switch(
              value: baseController.isDarkAppbar.value,
              onChanged: (bool value) {
                baseController.isDarkAppbar.value = value;
              },
            ),
          ).ripple().gestures(onTap: () {
            baseController.isDarkAppbar.value =
                !baseController.isDarkAppbar.value;
          }).backgroundColor(baseController.colorScheme(context).background)
        ],
      ),
    );
  }
}
