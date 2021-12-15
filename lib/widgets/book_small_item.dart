import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zhuishu/controller/base_controller.dart';
import 'package:zhuishu/model/book.dart';
import 'package:zhuishu/widgets/BookItemCover.dart';

import 'label.dart';

class BookSmallItem extends GetView<BaseController> {
  BookSmallItem({
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
      <Widget>[
        Text(
          book.title.toString().trim(),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ).fontSize(12.sp).fontWeight(FontWeight.bold),
        <Widget>[
          MLabel(
            book.majorCate.toString(),
            border: false,
            color: controller.colorScheme(context).primaryVariant,
          ).marginOnly(
            bottom: 5.w,
          ),
          MLabel(
            book.retentionRatio.toString() + "%留存",
            border: false,
            color: controller.colorScheme(context).error,
          ),
        ].toColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ]
          .toColumn(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
          )
          .paddingOnly(
            left: 10.w,
            top: 1.w,
            bottom: 3.w,
          )
          .expanded(),
    ].toRow();
  }
}
