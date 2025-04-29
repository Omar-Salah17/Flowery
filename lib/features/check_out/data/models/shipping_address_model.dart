class ShippingAddressModel {
  final String? street;
  final String? phone;
  final String? city;
  final String? lat;
  final String? long;

  ShippingAddressModel({
    required this.street,
    required this.phone,
    required this.city,
    required this.lat,
    required this.long,
  });

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    return ShippingAddressModel(
      street: json['street'] as String,
      phone: json['phone'] as String,
      city: json['city'] as String,
      lat: json['lat'] as String,
      long: json['long'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "shippingAddress": {
        'street': street,
        'phone': phone,
        'city': city,
        'lat': lat,
        'long': long,
      },
    };
  }
}
