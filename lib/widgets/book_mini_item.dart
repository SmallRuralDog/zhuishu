import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zhuishu/controller/base_controller.dart';
import 'package:zhuishu/model/book.dart';
import 'package:styled_widget/styled_widget.dart';

import 'BookItemCover.dart';

class BookMiniItem extends GetView<BaseController> {
  BookMiniItem({
    Key? key,
    required this.book,
    this.showReadButton = false,
  }) : super(key: key);

  Book book;
  bool showReadButton;

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      BookItemCover(book: book),
      Text(
        book.title.toString().trim(),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ).fontSize(12.sp).paddingSymmetric(
            vertical: 5.w,
          ),
    ]
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.stretch,
        )
        .width(77.5.w);
  }
}
