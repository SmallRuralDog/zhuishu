import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zhuishu/controller/base_controller.dart';

class MDivider extends GetView<BaseController> {
  const MDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: controller.get1Px(),
      color: controller.themeData(context).dividerColor.withAlpha(10),
    );
  }
}
