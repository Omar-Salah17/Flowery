import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final String? street;
  final String? phone;
  final String? city;
  final String? lat;
  final String? long;
  final String? username;
  final String? id;

  const Address({
    this.street,
    this.phone,
    this.city,
    this.lat,
    this.long,
    this.username,
    this.id,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    street: json['street'] as String?,
    phone: json['phone'] as String?,
    city: json['city'] as String?,
    lat: json['lat'] as String?,
    long: json['long'] as String?,
    username: json['username'] as String?,
    id: json['_id'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'street': street,
    'phone': phone,
    'city': city,
    'lat': lat,
    'long': long,
    'username': username,
    '_id': id,
  };

  @override
  List<Object?> get props {
    return [street, phone, city, lat, long, username, id];
  }
}
