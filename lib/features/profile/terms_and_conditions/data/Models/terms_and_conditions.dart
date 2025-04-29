import 'package:flowery/features/profile/about_us/data/Models/Content.dart';
import 'package:flowery/features/profile/about_us/data/Models/Style.dart';

class TermsAndConditions {
  TermsAndConditions({
    this.section,
    this.content,
    this.style,
    this.title,
    this.contentStyle,
  });

  factory TermsAndConditions.fromJson(dynamic json) {
    return TermsAndConditions(
      section: json['section'] as String?,
      content:
          json['content'] != null ? Content.fromJson(json['content']) : null,
      style: json['style'] != null ? Style.fromJson(json['style']) : null,
      title: json['title'] != null ? Content.fromJson(json['title']) : null,
      contentStyle:
          json['style']?['content'] != null
              ? Style.fromJson(json['style']['content'])
              : null,
    );
  }

  String? section;
  Content? content;
  Style? style;
  Content? title;
  Style? contentStyle;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['section'] = section;
    if (content != null) {
      map['content'] = content?.toJson();
    }
    if (style != null) {
      map['style'] = style?.toJson();
    }
    if (title != null) {
      map['title'] = title?.toJson();
    }
    return map;
  }
}
