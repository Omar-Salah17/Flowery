// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterEntity _$RegisterEntityFromJson(Map<String, dynamic> json) =>
    RegisterEntity(
      message: json['message'] as String,
      user: UserEntity.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String,
    );

Map<String, dynamic> _$RegisterEntityToJson(RegisterEntity instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': instance.user,
      'token': instance.token,
    };

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  email: json['email'] as String,
  gender: json['gender'] as String,
  phone: json['phone'] as String,
  photo: json['photo'] as String,
  role: json['role'] as String,
  wishlist: json['wishlist'],
  id: json['_id'] as String,
  addresses: json['addresses'],
  createdAt: json['createdAt'] as String,
);

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'gender': instance.gender,
      'phone': instance.phone,
      'photo': instance.photo,
      'role': instance.role,
      'wishlist': instance.wishlist,
      '_id': instance.id,
      'addresses': instance.addresses,
      'createdAt': instance.createdAt,
    };
