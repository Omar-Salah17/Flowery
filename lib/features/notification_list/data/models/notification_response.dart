import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'notification_response.g.dart';

@JsonSerializable()
class NotificationResponse {
  final String? message;
  final List<NotificationModel>? notifications;

  NotificationResponse({
     this.message,
     this.notifications,
  });

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationResponseToJson(this);
}


@JsonSerializable()
class NotificationModel {
  @JsonKey(name: '_id')
  final String? id;
  final String? title;
  final String? body;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  @JsonKey(name: '__v')
  final int? v;

  NotificationModel({
     this.id,
     this.title,
     this.body,
     this.createdAt,
     this.updatedAt,
     this.v,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}