import 'rating.dart';

class Book {
  Book({
      this.gg, 
      this.allowVoucher, 
      this.buytype, 
      this.hasCopyright, 
      this.advertRead, 
      this.isFineBook, 
      this.copyrightDesc, 
      this.totalFollower, 
      this.id, 
      this.title, 
      this.author, 
      this.shortIntro, 
      this.majorCate, 
      this.minorCate, 
      this.cover, 
      this.rating, 
      this.recommendIntro, 
      this.bigCover, 
      this.rectangleCover, 
      this.sizetype, 
      this.superscript, 
      this.contentType, 
      this.allowMonthly, 
      this.isSerial, 
      this.latelyFollower, 
      this.retentionRatio, 
      this.discount, 
      this.tags, 
      this.wordCount, 
      this.price, 
      this.bookIndicator, 
      this.otherReadRatio, 
      this.comment, 
      this.lastChapter, 
      this.updated, 
      this.chaptersCount, 
      this.editorComment, 
      this.promotionType, 
      this.onlyVip, 
      this.currentPrice, 
      this.originalPrice, 
      this.rank, 
      this.editorDate, 
      this.editor, 
      this.allowFree, 
      this.gender,});

  Book.fromJson(dynamic json) {
    gg = json['_gg'];
    allowVoucher = json['allowVoucher'];
    buytype = json['buytype'];
    hasCopyright = json['hasCopyright'];
    advertRead = json['advertRead'];
    isFineBook = json['isFineBook'];
    copyrightDesc = json['copyrightDesc'];
    totalFollower = json['totalFollower'];
    id = json['_id'];
    title = json['title'];
    author = json['author'];
    shortIntro = json['shortIntro'];
    majorCate = json['majorCate'];
    minorCate = json['minorCate'];
    cover = "https:"+json['cover'];
    rating = json['rating'] != null ? Rating.fromJson(json['rating']) : null;
    recommendIntro = json['recommendIntro'];
    bigCover = json['bigCover'];
    rectangleCover = json['rectangleCover'];
    sizetype = json['sizetype'];
    superscript = json['superscript'];
    contentType = json['contentType'];
    allowMonthly = json['allowMonthly'];
    isSerial = json['isSerial'];
    latelyFollower = json['latelyFollower'];
    retentionRatio = json['retentionRatio'];
    discount = json['discount'];
    tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    wordCount = json['wordCount'];
    price = json['price'];
    bookIndicator = json['bookIndicator'];
    otherReadRatio = json['otherReadRatio'];
    comment = json['comment'];
    lastChapter = json['lastChapter'];
    updated = json['updated'];
    chaptersCount = json['chaptersCount'];
    editorComment = json['editorComment'];
    promotionType = json['promotionType'];
    onlyVip = json['onlyVip'];
    currentPrice = json['currentPrice'];
    originalPrice = json['originalPrice'];
    rank = json['rank'];
    editorDate = json['editorDate'];
    editor = json['editor'];
    allowFree = json['allowFree'];
    gender = json['gender'];
  }
  bool? gg;
  bool? allowVoucher;
  int? buytype;
  bool? hasCopyright;
  bool? advertRead;
  bool? isFineBook;
  String? copyrightDesc;
  int? totalFollower;
  String? id;
  String? title;
  String? author;
  String? shortIntro;
  String? majorCate;
  String? minorCate;
  String? cover;
  Rating? rating;
  dynamic recommendIntro;
  dynamic bigCover;
  dynamic rectangleCover;
  int? sizetype;
  String? superscript;
  String? contentType;
  bool? allowMonthly;
  bool? isSerial;
  int? latelyFollower;
  double? retentionRatio;
  double? discount;
  List<String>? tags;
  int? wordCount;
  String? price;
  dynamic bookIndicator;
  double? otherReadRatio;
  dynamic comment;
  dynamic lastChapter;
  dynamic updated;
  int? chaptersCount;
  String? editorComment;
  dynamic promotionType;
  bool? onlyVip;
  dynamic currentPrice;
  dynamic originalPrice;
  dynamic rank;
  dynamic editorDate;
  dynamic editor;
  bool? allowFree;
  dynamic gender;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_gg'] = gg;
    map['allowVoucher'] = allowVoucher;
    map['buytype'] = buytype;
    map['hasCopyright'] = hasCopyright;
    map['advertRead'] = advertRead;
    map['isFineBook'] = isFineBook;
    map['copyrightDesc'] = copyrightDesc;
    map['totalFollower'] = totalFollower;
    map['_id'] = id;
    map['title'] = title;
    map['author'] = author;
    map['shortIntro'] = shortIntro;
    map['majorCate'] = majorCate;
    map['minorCate'] = minorCate;
    map['cover'] = cover;
    if (rating != null) {
      map['rating'] = rating?.toJson();
    }
    map['recommendIntro'] = recommendIntro;
    map['bigCover'] = bigCover;
    map['rectangleCover'] = rectangleCover;
    map['sizetype'] = sizetype;
    map['superscript'] = superscript;
    map['contentType'] = contentType;
    map['allowMonthly'] = allowMonthly;
    map['isSerial'] = isSerial;
    map['latelyFollower'] = latelyFollower;
    map['retentionRatio'] = retentionRatio;
    map['discount'] = discount;
    map['tags'] = tags;
    map['wordCount'] = wordCount;
    map['price'] = price;
    map['bookIndicator'] = bookIndicator;
    map['otherReadRatio'] = otherReadRatio;
    map['comment'] = comment;
    map['lastChapter'] = lastChapter;
    map['updated'] = updated;
    map['chaptersCount'] = chaptersCount;
    map['editorComment'] = editorComment;
    map['promotionType'] = promotionType;
    map['onlyVip'] = onlyVip;
    map['currentPrice'] = currentPrice;
    map['originalPrice'] = originalPrice;
    map['rank'] = rank;
    map['editorDate'] = editorDate;
    map['editor'] = editor;
    map['allowFree'] = allowFree;
    map['gender'] = gender;
    return map;
  }

}