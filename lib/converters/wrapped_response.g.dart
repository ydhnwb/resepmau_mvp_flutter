// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wrapped_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WrappedResponse _$WrappedResponseFromJson(Map<String, dynamic> json) {
  return WrappedResponse()
    ..message = json['message'] as String
    ..status = json['status'] as String
    ..data = json['data'] as Map<String, dynamic>;
}

Map<String, dynamic> _$WrappedResponseToJson(WrappedResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };
