class IndexBanner {
  IndexBanner({
      this.img, 
      this.bgImg, 
      this.link, 
      this.type, 
      this.order, 
      this.fullDes, 
      this.simpleDes, 
      this.title, 
      this.navSelectColor, 
      this.navUnselectColor, 
      this.searchBgColor, 
      this.navBgColor,});

  IndexBanner.fromJson(dynamic json) {
    img = json['img'];
    bgImg = json['bgImg'];
    link = json['link'];
    type = json['type'];
    order = json['order'];
    fullDes = json['fullDes'];
    simpleDes = json['simpleDes'];
    title = json['title'];
    navSelectColor = json['navSelectColor'];
    navUnselectColor = json['navUnselectColor'];
    searchBgColor = json['searchBgColor'];
    navBgColor = json['navBgColor'];
  }
  String? img;
  dynamic bgImg;
  String? link;
  String? type;
  int? order;
  String? fullDes;
  String? simpleDes;
  String? title;
  dynamic navSelectColor;
  dynamic navUnselectColor;
  dynamic searchBgColor;
  String? navBgColor;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['img'] = img;
    map['bgImg'] = bgImg;
    map['link'] = link;
    map['type'] = type;
    map['order'] = order;
    map['fullDes'] = fullDes;
    map['simpleDes'] = simpleDes;
    map['title'] = title;
    map['navSelectColor'] = navSelectColor;
    map['navUnselectColor'] = navUnselectColor;
    map['searchBgColor'] = searchBgColor;
    map['navBgColor'] = navBgColor;
    return map;
  }

}