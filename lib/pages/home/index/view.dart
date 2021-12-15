import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:zhuishu/model/book.dart';
import 'package:zhuishu/model/index_block.dart';
import 'package:zhuishu/widgets/book_big_item.dart';
import 'package:zhuishu/widgets/book_mini_item.dart';
import 'package:zhuishu/widgets/book_small_item.dart';
import 'package:zhuishu/widgets/image.dart';

import 'logic.dart';

class IndexComponent extends StatelessWidget {
  final logic = Get.put(IndexLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          title: Text(
            "追书神器",
            style: GoogleFonts.zcoolKuaiLe(),
          ).fontSize(25.sp),
          actions: [
            IconButton(
              onPressed: () => {},
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: () => {},
              icon: Icon(Icons.crop_free),
            ),
          ],
        ),
        preferredSize: logic.appBarHeight,
      ),
      body: Obx(
        () => logic.initData.value
            ? SmartRefresher(
                controller: logic.refreshController,
                enablePullUp: !logic.noMore.value,
                header: const WaterDropHeader(),
                footer: const ClassicFooter(),
                onRefresh: logic.onRefresh,
                onLoading: logic.onLoading,
                child: _buildBody(context),
              )
            : const Center(
                child: GFLoader(),
              ),
      ),
    );
  }

  _buildBody(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: logic.indexBlockList.value.length + 2,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) return const Banner();
        if (index == 1) return const GridMenu();
        return Block(
          index: index - 2,
        );
      },
    );
  }
}

class Banner extends GetView<IndexLogic> {
  const Banner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 130.w,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: controller.indexBannerList.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              child: MImage(
                image: i.img ?? "",
                boxFit: BoxFit.cover,
              ),
            )
                .width(375.w)
                .ripple()
                .clipRRect(
                  all: 10.w,
                )
                .gestures(
                  onTap: () => {},
                );
          },
        );
      }).toList(),
    )
        .paddingSymmetric(
          vertical: 10.w,
        )
        .backgroundColor(controller.colorScheme(context).background);
  }
}

class GridMenu extends GetView<IndexLogic> {
  const GridMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.indexGridMenuList
        .map(
          (i) => <Widget>[
            MImage(
              image: i.img ?? '',
              width: 45.w,
              height: 45.w,
            ),
            Text(i.title ?? "")
                .fontSize(
                  12.sp,
                )
                .opacity(0.6),
          ]
              .toColumn()
              .paddingAll(10.w)
              .ripple()
              .clipRRect(
                all: 10.w,
              )
              .gestures(
                onTap: () => {},
              ),
        )
        .toList()
        .toRow(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        )
        .paddingOnly(
          bottom: 10.w,
        )
        .backgroundColor(controller.colorScheme(context).background);
  }
}

class Block extends GetView<IndexLogic> {
  Block({Key? key, required this.index}) : super(key: key);
  int index;

  @override
  Widget build(BuildContext context) {
    IndexBlock indexBlock = controller.indexBlockList[index];

    List<Book> books = indexBlock.books ?? [];

    if (indexBlock.isLast == true) {
      return <Widget>[
        const Text(
          "猜你喜欢",
        ).fontSize(18.sp).fontWeight(FontWeight.bold).paddingOnly(
              bottom: 15.w,
              left: 15.w,
            ),
        books
            .map(
              (book) => BookBigItem(
                book: book,
                showReadButton: indexBlock.showReadButton == 1,
              ).ripple().gestures(
                    onTap: () => {},
                  ),
            )
            .toList()
            .toColumn()
      ]
          .toColumn(crossAxisAlignment: CrossAxisAlignment.start)
          .marginOnly(
            top: 15.w,
          )
          .backgroundColor(controller.colorScheme(context).background);
    }

    return <Widget>[
      //头部
      <Widget>[
        <Widget>[
          Icon(
            Icons.auto_awesome_mosaic,
            color: controller.colorScheme(context).error,
          ),
          Text(indexBlock.title ?? "")
              .fontSize(18.sp)
              .fontWeight(FontWeight.bold)
              .marginOnly(
                left: 5.w,
              ),
        ].toRow().expanded(),
        const Icon(Icons.navigate_next).opacity(0.3),
      ].toRow().paddingSymmetric(
            vertical: 7.5.w,
            horizontal: 15.w,
          ),
      //大横条布局
      BookBigItem(
        book: books.first,
        showReadButton: indexBlock.showReadButton == 1,
      ).ripple().gestures(
            onTap: () => {},
          ),

      index % 2 == 0
          ?
          //四格中等布局
          GridView.count(
              crossAxisCount: 2,
              childAspectRatio: (375 / 2).w / (104 + 15).w,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: books
                  .getRange(1, 5)
                  .map(
                    (book) => BookSmallItem(book: book)
                        .paddingSymmetric(
                          horizontal: 15.w,
                          vertical: 7.5.w,
                        )
                        .ripple()
                        .gestures(
                          onTap: () => {},
                        ),
                  )
                  .toList(),
            ).marginOnly(
              top: 7.5.w,
            )
          : books
              .getRange(1, 5)
              .map(
                (book) => BookMiniItem(
                  book: book,
                ).gestures(
                  onTap: () => {},
                ),
              )
              .toList()
              .toRow(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
              )
              .paddingSymmetric(
                horizontal: 15.w,
              )
              .marginOnly(
                top: 15.w,
                bottom: 7.5.w,
              ),
    ].toColumn().backgroundColor(controller.colorScheme(context).background);
  }
}
