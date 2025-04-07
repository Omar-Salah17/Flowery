import 'package:json_annotation/json_annotation.dart';

part 'plus_code_response.g.dart';

@JsonSerializable()
class PlusCodeResponse {
  final PlusCode plusCode;

  PlusCodeResponse({required this.plusCode});

  factory PlusCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$PlusCodeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PlusCodeResponseToJson(this);
}

@JsonSerializable()
class PlusCode {
  final String globalCode;
  final String? localCode;

  PlusCode({required this.globalCode, this.localCode});

  factory PlusCode.fromJson(Map<String, dynamic> json) =>
      _$PlusCodeFromJson(json);
  Map<String, dynamic> toJson() => _$PlusCodeToJson(this);
}