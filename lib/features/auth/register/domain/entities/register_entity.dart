import 'package:json_annotation/json_annotation.dart';

part 'register_entity.g.dart';

@JsonSerializable()
class RegisterEntity {
  String message;
  UserEntity user;
  String token;

  RegisterEntity({required this.message, required this.user, required this.token});

  factory RegisterEntity.fromJson(Map<String, dynamic> json) => _$RegisterEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterEntityToJson(this);
}

@JsonSerializable()
class UserEntity {
  String firstName;
  String lastName;
  String email;
  String gender;
  String phone;
  String photo;
  String role;
  dynamic wishlist;
  @JsonKey(name: '_id')
  String id;
  dynamic addresses;
  String createdAt;

  UserEntity({required this.firstName, required this.lastName, required this.email, required this.gender, required this.phone, required this.photo, required this.role, required this.wishlist, required this.id, required this.addresses, required this.createdAt});

  factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);

}

