import 'TextAlign.dart';

class Style {
  Style({
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.backgroundColor,
  });

  factory Style.fromJson(dynamic json) {
    return Style(
      fontSize: json['fontSize'] as num?,
      fontWeight: json['fontWeight'] as String?,
      color: json['color'] as String?,
      textAlign: json['textAlign'] != null
          ? TextAlign.fromJson(json['textAlign'])
          : null,
      backgroundColor: json['backgroundColor'] as String?,
    );
  }

  num? fontSize;
  String? fontWeight;
  String? color;
  TextAlign? textAlign;
  String? backgroundColor;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fontSize'] = fontSize;
    map['fontWeight'] = fontWeight;
    map['color'] = color;
    if (textAlign != null) {
      map['textAlign'] = textAlign?.toJson();
    }
    map['backgroundColor'] = backgroundColor;
    return map;
  }
}