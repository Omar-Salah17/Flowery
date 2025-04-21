import 'package:equatable/equatable.dart';

import 'address.dart';

class AddAddressResponse extends Equatable {
  final String? message;
  final List<Address>? address;

  const AddAddressResponse({this.message, this.address});

  factory AddAddressResponse.fromJson(Map<String, dynamic> json) {
    return AddAddressResponse(
      message: json['message'] as String?,
      address:
          (json['address'] as List<dynamic>?)
              ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'address': address?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [message, address];
}
