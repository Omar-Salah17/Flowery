import 'package:flowery/features/auth/register/domain/entities/register_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse {
  String? message;
  UserDto? user;
  String? token;

  RegisterResponse({this.message, this.user, this.token});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
  RegisterEntity toRegisterEntity() {
    return RegisterEntity(
      message: message ?? '',
      user: user!.toUserEntity(),
      token: token ?? '',
    );
  }
}

@JsonSerializable()
class UserDto {
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? phone;
  String? photo;
  String? role;
  dynamic wishlist;
  @JsonKey(name: '_id')
  String? id;
  dynamic addresses;
  String? createdAt;

  UserDto({
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.role,
    this.wishlist,
    this.id,
    this.addresses,
    this.createdAt,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
  UserEntity toUserEntity() {
    return UserEntity(
      firstName: firstName ?? '',
      lastName: lastName ?? '',
      email: email ?? '',
      addresses: addresses ?? '',
      createdAt: createdAt ?? '',
      id: id ?? '',
      phone: phone ?? '',
      photo: photo ?? '',
      role: role ?? '',
      wishlist: wishlist ?? '',
      gender: gender ?? '',
    );
  }
}
