
import 'package:json_annotation/json_annotation.dart';
part 'logged_user_address_model.g.dart';

@JsonSerializable()
class LoggedUserAddressModel {
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'addresses')
  List<Addresses>? addresses;

  LoggedUserAddressModel({this.message, this.addresses});

  factory LoggedUserAddressModel.fromJson(Map<String, dynamic> json) => _$LoggedUserAddressModelFromJson(json);

  static List<LoggedUserAddressModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(LoggedUserAddressModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$LoggedUserAddressModelToJson(this);
}

@JsonSerializable()
class Addresses {
  @JsonKey(name: 'street')
  String? street;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'city')
  String? city;
  @JsonKey(name: 'lat')
  String? lat;
  @JsonKey(name: 'long')
  String? long;
  @JsonKey(name: 'username')
  String? username;
  @JsonKey(name: '_id')
  String? id;

  Addresses({this.street, this.phone, this.city, this.lat, this.long, this.username, this.id});

  factory Addresses.fromJson(Map<String, dynamic> json) => _$AddressesFromJson(json);

  static List<Addresses> fromList(List<Map<String, dynamic>> list) {
    return list.map(Addresses.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$AddressesToJson(this);
}