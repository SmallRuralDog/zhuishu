import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:flutter/material.dart';
import 'package:zhuishu/controller/base_controller.dart';

class MLabel extends GetView<BaseController> {
  MLabel(
    this.text, {
    Key? key,
    this.color,
    this.border = true,
  }) : super(key: key);

  Color? color;

  String text;

  bool border;

  @override
  Widget build(BuildContext context) {
    Widget label = Text(text).fontSize(10.sp).textColor(color);

    if (border) {
      label = label
          .paddingSymmetric(
            horizontal: 3.w,
          )
          .decorated(
              border: Border.all(
                width: controller.get1Px(),
                color: color?.withOpacity(0.5) ??
                    controller.colorScheme(context).onBackground,
              ),
              borderRadius: BorderRadius.circular(
                3.w,
              ));
    }

    return label;
  }
}
