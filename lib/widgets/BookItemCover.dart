import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zhuishu/model/book.dart';
import 'package:zhuishu/widgets/image.dart';

class BookItemCover extends StatefulWidget {
  BookItemCover({required this.book});

  Book book;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BookItemCoverState();
  }
}

class BookItemCoverState extends State<BookItemCover> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    Book book = widget.book;

    return <Widget>[
      MImage(
        image: book.cover ?? "",
        width: 77.5.w,
        height: 104.w,
        radius: 5.w,
      ),
      book.isSerial == true
          ? const SizedBox()
          : Image.asset("images/完结.png").positioned(
              top: 2.w,
              right: 0,
              width: 30.w,
            ),
      book.onlyVip == true
          ? const SizedBox()
          : Image.asset("images/免费标签.png").positioned(
              top: 2.w,
              left: 0,
              width: 30.w,
            ),
    ]
        .toStack()
        .gestures(
          onTapChange: (tapStatus) => setState(() => isPressed = tapStatus),
        )
        .scale(
          all: isPressed ? 0.95 : 1.0,
          animate: true,
        )
        .animate(const Duration(milliseconds: 150), Curves.easeOut);
  }
}
