import 'package:json_annotation/json_annotation.dart';
part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'user')
  UserData? user;

  UserResponse({this.message, this.user});

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  static List<UserResponse> fromList(List<Map<String, dynamic>> list) {
    return list.map(UserResponse.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class UserData {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'firstName')
  String? firstName;
  @JsonKey(name: 'lastName')
  String? lastName;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'gender')
  String? gender;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'photo')
  String? photo;
  @JsonKey(name: 'role')
  String? role;
  @JsonKey(name: 'wishlist')
  List<dynamic>? wishlist;
  @JsonKey(name: 'addresses')
  List<dynamic>? addresses;
  @JsonKey(name: 'createdAt')
  String? createdAt;

  UserData({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.role,
    this.wishlist,
    this.addresses,
    this.createdAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  static List<UserData> fromList(List<Map<String, dynamic>> list) {
    return list.map(UserData.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

@JsonSerializable()
class UpdatedUserModel {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;

  UpdatedUserModel({this.firstName, this.lastName, this.email, this.phone});

  factory UpdatedUserModel.fromJson(Map<String, dynamic> json) =>
      _$UpdatedUserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UpdatedUserModelToJson(this);
}
