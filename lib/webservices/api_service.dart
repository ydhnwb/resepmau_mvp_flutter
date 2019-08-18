import 'dart:io';
import 'package:dio/dio.dart';
import 'package:resepmau_flutter/converters/wrapped_response.dart';
import 'package:resepmau_flutter/converters/wrapped_list_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://resep-mau.herokuapp.com/api/")
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @FormUrlEncoded()
  @POST("login")
  Future<WrappedResponse> login(@Field("email") String email, @Field("password") String password);

  @FormUrlEncoded()
  @POST("register")
  Future<WrappedResponse> register(@Field("name") String name, @Field("email") String email, @Field("password") String password);

  @GET("post")
  Future<WrappedListResponse> all(@Header("Authorization") String token);

  @FormUrlEncoded()
  @POST("post")
  Future<WrappedResponse> create(@Header("Authorization") String token, @Field("title") String title, @Field("content") String content);

  @PUT("post/{id}")
  Future<WrappedResponse> updatePost(@Header("Authorization") String token, @Path("id") String id, @Body() Map<String, dynamic> body);

  @GET("post/{id}")
  Future<WrappedResponse> getById(@Header("Authorization") String token, @Path("id") String id);

  @DELETE("post/{id}")
  Future<WrappedResponse> delete(@Header("Authorization") String token, @Path("id") String id);
}
