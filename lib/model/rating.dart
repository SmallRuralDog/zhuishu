class Rating {
  Rating({
      this.count, 
      this.score,});

  Rating.fromJson(dynamic json) {
    count = json['count'];
    score = json['score'];
  }
  int? count;
  double? score;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['score'] = score;
    return map;
  }

}