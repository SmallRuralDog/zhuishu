import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zhuishu/pages/home/home_page.dart';

import 'controller/base_controller.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BaseController controller = Get.put(BaseController());

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => Obx(
        () => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: controller.themeMode.value,
          theme: FlexThemeData.light(
            scheme: controller.scheme.value,
            surfaceMode: FlexSurfaceMode.custom,
            background: Colors.white,
            blendLevel: 18,
            appBarStyle: controller.isDarkAppbar.value
                ? FlexAppBarStyle.primary
                : FlexAppBarStyle.background,
            appBarOpacity: 1,
            appBarElevation: 0,
            transparentStatusBar: true,
            tabBarStyle: FlexTabBarStyle.forBackground,
            tooltipsMatchBackground: true,
            swapColors: false,
            lightIsWhite: false,
            useSubThemes: true,
            visualDensity: FlexColorScheme.comfortablePlatformDensity,
            subThemesData: const FlexSubThemesData(
              useTextTheme: true,
              fabUseShape: true,
              interactionEffects: true,
              bottomNavigationBarOpacity: 0.95,
              bottomNavigationBarElevation: 5,
              inputDecoratorIsFilled: true,
              inputDecoratorBorderType: FlexInputBorderType.outline,
              inputDecoratorUnfocusedHasBorder: true,
              blendOnColors: true,
              blendTextTheme: true,
              popupMenuOpacity: 0.95,
              buttonMinSize: Size(15, 10),
              buttonPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            ),
          ),
          darkTheme: FlexThemeData.dark(
            scheme: controller.scheme.value,
            surfaceMode: FlexSurfaceMode.custom,
            background: Colors.black87,
            blendLevel: 18,
            appBarStyle: FlexAppBarStyle.background,
            appBarOpacity: 0.95,
            appBarElevation: 0,
            transparentStatusBar: true,
            tabBarStyle: FlexTabBarStyle.flutterDefault,
            tooltipsMatchBackground: true,
            swapColors: false,
            darkIsTrueBlack: false,
            useSubThemes: true,
            visualDensity: FlexColorScheme.comfortablePlatformDensity,
            subThemesData: const FlexSubThemesData(
              useTextTheme: true,
              fabUseShape: true,
              interactionEffects: true,
              bottomNavigationBarOpacity: 0.95,
              bottomNavigationBarElevation: 5,
              inputDecoratorIsFilled: true,
              inputDecoratorBorderType: FlexInputBorderType.outline,
              inputDecoratorUnfocusedHasBorder: true,
              blendOnColors: true,
              blendTextTheme: true,
              popupMenuOpacity: 0.95,
              buttonMinSize: Size(15, 10),
              buttonPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            ),
          ),
          home: HomePage(),
        ),
      ),
    );
  }
}
