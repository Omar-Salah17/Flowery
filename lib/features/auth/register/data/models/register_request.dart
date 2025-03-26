import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  String firstName;
  String lastName;
  String email;
  String password;
  String rePassword;
  String phone;
  String gender;

  RegisterRequest({ required this.firstName,required this.lastName,required this.email,required this.password,required this.rePassword,required this.phone,required this.gender});

  factory RegisterRequest.fromJson(Map<String, dynamic> json) => _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}

