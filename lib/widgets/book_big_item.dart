import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zhuishu/controller/base_controller.dart';
import 'package:zhuishu/model/book.dart';
import 'package:zhuishu/widgets/BookItemCover.dart';
import 'package:zhuishu/widgets/label.dart';

class BookBigItem extends GetView<BaseController> {
  BookBigItem({
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
      //右边主体
      <Widget>[
        <Widget>[
          //标题
          <Widget>[
            Text(
              book.title.toString().trim(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
                .fontSize(15.sp)
                .fontWeight(FontWeight.bold)
                .marginOnly(
                  right: 15.w,
                )
                .expanded(),
            //去阅读按钮
            showReadButton
                ? <Widget>[
                    Container(child: Image.asset("images/去阅读.png"))
                        .width(12.w)
                        .marginOnly(
                          right: 3.w,
                        ),
                    const Text("去阅读")
                        .fontSize(12.sp)
                        .textColor(controller.colorScheme(context).error),
                  ].toRow()
                : Container(),
          ].toRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          //描述
          Text(
            book.shortIntro.toString().trim(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ).fontSize(12.sp).opacity(0.6).marginOnly(
                top: 5.w,
              ),
        ].toColumn(),
        //底部
        <Widget>[
          //底部左边
          Text(book.author ?? "").fontSize(11.sp).opacity(0.6),
          //底部右边
          <Widget>[
            MLabel(
              book.majorCate.toString(),
              color: controller.colorScheme(context).primaryVariant,
            ),
            MLabel(
              book.retentionRatio.toString() + "%留存",
              color: controller.colorScheme(context).error,
            ).marginOnly(
              left: 5.w,
            ),
          ].toRow(),
        ].toRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      ]
          .toColumn(mainAxisAlignment: MainAxisAlignment.spaceBetween)
          .paddingOnly(
            left: 10.w,
            top: 1.w,
            bottom: 3.w,
          )
          .expanded(),
    ]
        .toRow(crossAxisAlignment: CrossAxisAlignment.stretch)
        .height(104.w)
        .paddingSymmetric(
          vertical: 7.5.w,
          horizontal: 15.w,
        );
  }
}
