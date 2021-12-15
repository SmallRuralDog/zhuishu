import 'package:get/get.dart';

class Provider extends GetConnect {
  Future<Response> getIndex({int page = 1}) => get(
      "https://b.zhuishushenqi.com/category/page?node=e5fe6058afa449e4a8b9b3fb843c2bcd&sex=male&page=$page&token=&userid=&cv=&groupid=&pl=null&tabType=jx&packageName=");
}
