import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  Size appBarHeight = const Size.fromHeight(kToolbarHeight);

  var currentIndex = 1.obs;

  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: currentIndex.value);
  }



  ThemeData themeData(BuildContext context) {
    return Theme.of(context);
  }

  ColorScheme colorScheme(BuildContext context) {
    return Theme.of(context).colorScheme;
  }

  onTap(int index) {
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }

  double get1Px() {
    return 1 / Get.pixelRatio;
  }

  //Theme
  var schemeIndex = 0.obs;
  var scheme = FlexScheme.ebonyClay.obs;
  var themeMode = ThemeMode.system.obs;

  var isDarkAppbar = false.obs;

  onThemeChange(int index) {
    schemeIndex.value = index;
    scheme.value = FlexScheme.values[index];
  }

  onThemeModeChanged(ThemeMode value){
    themeMode.value = value;
  }
}
