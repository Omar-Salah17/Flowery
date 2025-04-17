import 'package:equatable/equatable.dart';

class ClearCartResponse extends Equatable {
  final String message;

  const ClearCartResponse({required this.message});

  factory ClearCartResponse.fromJson(Map<String, dynamic> json) {
    return ClearCartResponse(message: json['message']);
  }

  @override
  List<Object?> get props => [message];
}
