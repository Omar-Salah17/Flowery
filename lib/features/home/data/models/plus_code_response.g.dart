// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plus_code_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlusCodeResponse _$PlusCodeResponseFromJson(Map<String, dynamic> json) =>
    PlusCodeResponse(
      plusCode: PlusCode.fromJson(json['plusCode'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlusCodeResponseToJson(PlusCodeResponse instance) =>
    <String, dynamic>{'plusCode': instance.plusCode};

PlusCode _$PlusCodeFromJson(Map<String, dynamic> json) => PlusCode(
  globalCode: json['globalCode'] as String,
  localCode: json['localCode'] as String?,
);

Map<String, dynamic> _$PlusCodeToJson(PlusCode instance) => <String, dynamic>{
  'globalCode': instance.globalCode,
  'localCode': instance.localCode,
};
