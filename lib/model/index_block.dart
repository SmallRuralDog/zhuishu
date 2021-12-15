import 'package:zhuishu/model/book.dart';

class IndexBlock {
  IndexBlock({
    this.id,
    this.dataType,
    this.isLast,
    this.created,
    this.order,
    this.alias,
    this.title,
    this.bookType,
    this.sellType,
    this.icon,
    this.sex,
    this.secondTitle,
    this.showDataType,
    this.endTime,
    this.exposureType,
    this.rotateDetail,
    this.rotateNum,
    this.gender,
    this.majorCat,
    this.showReadButton,
    this.sort,
    this.books,
    this.genderbooks,
  });

  IndexBlock.fromJson(dynamic json) {
    id = json['_id'];
    dataType = json['dataType'];
    isLast = json['isLast'];
    created = json['created'];
    order = json['order'];
    alias = json['alias'];
    title = json['title'];
    bookType = json['bookType'];
    sellType = json['sellType'];
    icon = json['icon'];
    sex = json['sex'];
    secondTitle = json['secondTitle'];
    showDataType = json['showDataType'];
    endTime = json['endTime'];
    exposureType = json['exposureType'];
    rotateDetail = json['rotateDetail'];
    rotateNum = json['rotateNum'];
    gender = json['gender'];
    majorCat = json['majorCat'];
    showReadButton = json['showReadButton'];
    sort = json['sort'];
    if (json['books'] != null) {
      books = [];
      json['books'].forEach((v) {
        books?.add(Book.fromJson(v));
      });
    }
    genderbooks = json['genderbooks'];
  }

  String? id;
  String? dataType;
  bool? isLast;
  String? created;
  int? order;
  String? alias;
  String? title;
  String? bookType;
  String? sellType;
  String? icon;
  String? sex;
  dynamic secondTitle;
  String? showDataType;
  double? endTime;
  int? exposureType;
  int? rotateDetail;
  int? rotateNum;
  dynamic gender;
  String? majorCat;
  int? showReadButton;
  bool? sort;
  List<Book>? books;
  dynamic genderbooks;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['dataType'] = dataType;
    map['isLast'] = isLast;
    map['created'] = created;
    map['order'] = order;
    map['alias'] = alias;
    map['title'] = title;
    map['bookType'] = bookType;
    map['sellType'] = sellType;
    map['icon'] = icon;
    map['sex'] = sex;
    map['secondTitle'] = secondTitle;
    map['showDataType'] = showDataType;
    map['endTime'] = endTime;
    map['exposureType'] = exposureType;
    map['rotateDetail'] = rotateDetail;
    map['rotateNum'] = rotateNum;
    map['gender'] = gender;
    map['majorCat'] = majorCat;
    map['showReadButton'] = showReadButton;
    map['sort'] = sort;
    if (books != null) {
      map['books'] = books?.map((v) => v.toJson()).toList();
    }
    map['genderbooks'] = genderbooks;
    return map;
  }
}
