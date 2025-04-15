import 'dart:core';

import 'package:flowery/core/enums/gender_enum.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  final String? message;
  final UserModel? user;

  ProfileResponse(this.message, this.user);

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}

@JsonSerializable()
class UserModel {
  @JsonKey(name: '_id')
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? phone;
  final Gender? gender;
  final String? photo;
  final String? role;
  final List<dynamic>? wishlist;
  final List<dynamic>? addresses;
  final String? createdAt;

  UserModel( {
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.phone,
    this.gender,
    this.photo,
    this.role,
    this.wishlist,
    this.addresses,
    this.createdAt,
  } );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class UpdatedUserModel {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;



  UpdatedUserModel( {
    this.firstName,
    this.lastName,
    this.email,
    this.phone,

  } );

  factory UpdatedUserModel.fromJson(Map<String, dynamic> json) =>
      _$UpdatedUserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UpdatedUserModelToJson(this);
}
