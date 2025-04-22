
import 'package:json_annotation/json_annotation.dart';
part 'address_model.g.dart';

@JsonSerializable()
class AddressModel {
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'address')
  List<Address>? address;

  AddressModel({this.message, this.address});

  factory AddressModel.fromJson(Map<String, dynamic> json) => _$AddressModelFromJson(json);

  static List<AddressModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(AddressModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}

@JsonSerializable()
class Address {
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

  Address({this.street, this.phone, this.city, this.lat, this.long, this.username, this.id});

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

  static List<Address> fromList(List<Map<String, dynamic>> list) {
    return list.map(Address.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}