import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zhuishu/controller/base_controller.dart';


class ThemePopupMenu extends GetView<BaseController> {
  @override
  Widget build(BuildContext context) {


    return PopupMenuButton<int>(
        padding: EdgeInsets.zero,
        itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
          for (int i = 0; i < FlexColor.schemesList.length; i++)
            PopupMenuItem<int>(
              value: i,
              child: ListTile(
                leading: Icon(
                  Icons.lens,
                  size: 35,
                  color: !Get.isDarkMode
                      ? FlexColor.schemesList[i].light.primary
                      : FlexColor.schemesList[i].dark.primary,
                ),
                title: Text(FlexColor.schemesList[i].name),
              ),
            )
        ],
        onSelected: controller.onThemeChange,
        child: ListTile(
          title: const Text(
            "主题色",
          ),
          trailing: Icon(
            Icons.lens,
            size: 40,
            color: controller.colorScheme(context).primary,
          ),
        ).ripple().backgroundColor(controller.colorScheme(context).background),
      );
  }
}
