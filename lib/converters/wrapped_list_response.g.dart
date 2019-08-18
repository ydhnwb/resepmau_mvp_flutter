// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wrapped_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WrappedListResponse _$WrappedListResponseFromJson(Map<String, dynamic> json) {
  return WrappedListResponse()
    ..message = json['message'] as String
    ..status = json['status'] as String
    ..data = json['data'] as List;
}

Map<String, dynamic> _$WrappedListResponseToJson(
        WrappedListResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'data': instance.data,
    };
