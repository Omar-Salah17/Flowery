import 'package:equatable/equatable.dart';

class UserAddressData extends Equatable {
  final String? street;
  final String? phone;
  final String? city;
  final String? lat;
  final String? long;
  final String? username;

  const UserAddressData({
    this.street,
    this.phone,
    this.city,
    this.lat,
    this.long,
    this.username,
  });

  factory UserAddressData.fromJson(Map<String, dynamic> json) {
    return UserAddressData(
      street: json['street'] as String?,
      phone: json['phone'] as String?,
      city: json['city'] as String?,
      lat: json['lat'] as String?,
      long: json['long'] as String?,
      username: json['username'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'street': street,
    'phone': phone,
    'city': city,
    'lat': lat,
    'long': long,
    'username': username,
  };

  @override
  List<Object?> get props => [street, phone, city, lat, long, username];
}
