// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    ProfileResponse(
      json['message'] as String?,
      json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{'message': instance.message, 'user': instance.user};

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: json['_id'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  email: json['email'] as String?,
  password: json['password'] as String?,
  phone: json['phone'] as String?,
  gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
  photo: json['photo'] as String?,
  role: json['role'] as String?,
  wishlist: json['wishlist'] as List<dynamic>?,
  addresses: json['addresses'] as List<dynamic>?,
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  '_id': instance.id,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'email': instance.email,
  'password': instance.password,
  'phone': instance.phone,
  'gender': _$GenderEnumMap[instance.gender],
  'photo': instance.photo,
  'role': instance.role,
  'wishlist': instance.wishlist,
  'addresses': instance.addresses,
  'createdAt': instance.createdAt,
};

const _$GenderEnumMap = {Gender.male: 'male', Gender.female: 'female'};

UpdatedUserModel _$UpdatedUserModelFromJson(Map<String, dynamic> json) =>
    UpdatedUserModel(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$UpdatedUserModelToJson(UpdatedUserModel instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
    };
