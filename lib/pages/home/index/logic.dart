import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:zhuishu/controller/base_controller.dart';
import 'package:zhuishu/model/index_banner.dart';
import 'package:zhuishu/model/index_block.dart';
import 'package:zhuishu/model/index_grid_menu.dart';
import 'package:zhuishu/provider/provider.dart';
import 'package:get/get.dart';

class IndexLogic extends BaseController {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  void onRefresh() async {
    page = 1;
    noMore.value = false;
    getIndexData(
      reload: true,
    );
  }

  void onLoading() async {
    page++;
    getIndexData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
    getIndexData();
  }

  var initData = false.obs;
  var noMore = false.obs;
  var page = 1;

  List<IndexBanner> indexBannerList = [];
  List<IndexGridMenu> indexGridMenuList = [];

  var indexBlockList = <IndexBlock>[].obs;

  getIndexData({bool reload = false}) {
    Provider().getIndex(page: page).then((value) {
      //TODO 这里没有考虑异常情况
      List<dynamic> data = value.body['data'];
      if (reload) {
        indexBlockList.clear();
      }
      if (data.isEmpty) {
        refreshController.loadFailed();
        noMore.value = true;
      }
      for (var element in data) {
        if (element['alias'] == 'syjxbns') {
          indexBannerList = (element['advs'] as List)
              .map((e) => IndexBanner.fromJson(e))
              .toList();
        } else if (element['alias'] == 'scysthl') {
          indexGridMenuList = (element['advs'] as List)
              .map((e) => IndexGridMenu.fromJson(e))
              .toList();
        } else if (element['books'] != null) {
          indexBlockList.addIf((element['books'] as List).isNotEmpty,
              IndexBlock.fromJson(element));
        }
      }
      initData.value = true;
      refreshController.refreshCompleted();
      refreshController.loadComplete();
    });
  }
}
