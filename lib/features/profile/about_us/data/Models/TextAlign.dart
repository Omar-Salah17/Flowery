/// en : "center"
/// ar : "center"

class TextAlign {
  TextAlign({
      this.en, 
      this.ar,});

  TextAlign.fromJson(dynamic json) {
    en = json['en'] as String?;
    ar = json['ar'] as String?;
  }
  String? en;
  String? ar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['en'] = en;
    map['ar'] = ar;
    return map;
  }

}