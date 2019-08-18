import 'package:resepmau_flutter/webservices/api_service.dart';
import 'package:json_annotation/json_annotation.dart';

part "user.g.dart";

@JsonSerializable()
class User{
  @JsonKey()
  int id;
  @JsonKey()
  String name;
  @JsonKey()
  String email;
  @JsonKey()
  String api_token;

  User();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

}