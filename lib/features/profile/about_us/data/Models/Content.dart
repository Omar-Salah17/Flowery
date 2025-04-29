class Content {
  Content({this.en, this.ar, this.enList, this.arList});

  factory Content.fromJson(dynamic json) {
    // Handle case where content is a List
    if (json['en'] is List) {
      return Content(
        enList: (json['en'] as List).map((e) => e.toString()).toList(),
        arList: (json['ar'] as List).map((e) => e.toString()).toList(),
      );
    }
    // Handle case where content is a String
    else {
      return Content(en: json['en']?.toString(), ar: json['ar']?.toString());
    }
  }

  String? en;
  String? ar;
  List<String>? enList;
  List<String>? arList;

  bool get isList => enList != null || arList != null;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (en != null && ar != null) {
      map['en'] = en;
      map['ar'] = ar;
    } else if (enList != null && arList != null) {
      map['en'] = enList;
      map['ar'] = arList;
    }
    return map;
  }
}
