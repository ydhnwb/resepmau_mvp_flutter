// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio) {
    ArgumentError.checkNotNull(_dio, '_dio');
    _dio.options.baseUrl = 'https://resep-mau.herokuapp.com/api/';
  }

  final Dio _dio;

  @override
  login(email, password) async {
    ArgumentError.checkNotNull(email, 'email');
    ArgumentError.checkNotNull(password, 'password');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data =
        FormData.from(<String, dynamic>{'email': email, 'password': password});
    final Response<Map<String, dynamic>> _result = await _dio.request('login',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType:
                ContentType.parse('application/x-www-form-urlencoded')),
        data: _data);
    final value = WrappedResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  register(name, email, password) async {
    ArgumentError.checkNotNull(name, 'name');
    ArgumentError.checkNotNull(email, 'email');
    ArgumentError.checkNotNull(password, 'password');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData.from(
        <String, dynamic>{'name': name, 'email': email, 'password': password});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'register',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            contentType:
                ContentType.parse('application/x-www-form-urlencoded')),
        data: _data);
    final value = WrappedResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  all(token) async {
    ArgumentError.checkNotNull(token, 'token');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request('post',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{'Authorization': token},
            extra: _extra),
        data: _data);
    final value = WrappedListResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  create(token, title, content) async {
    ArgumentError.checkNotNull(token, 'token');
    ArgumentError.checkNotNull(title, 'title');
    ArgumentError.checkNotNull(content, 'content');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data =
        FormData.from(<String, dynamic>{'title': title, 'content': content});
    final Response<Map<String, dynamic>> _result = await _dio.request('post',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{'Authorization': token},
            extra: _extra,
            contentType:
                ContentType.parse('application/x-www-form-urlencoded')),
        data: _data);
    final value = WrappedResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  updatePost(token, id, body) async {
    ArgumentError.checkNotNull(token, 'token');
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(body, 'body');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body ?? <String, dynamic>{});
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'post/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{'Authorization': token},
            extra: _extra),
        data: _data);
    final value = WrappedResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getById(token, id) async {
    ArgumentError.checkNotNull(token, 'token');
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'post/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{'Authorization': token},
            extra: _extra),
        data: _data);
    final value = WrappedResponse.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  delete(token, id) async {
    ArgumentError.checkNotNull(token, 'token');
    ArgumentError.checkNotNull(id, 'id');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'post/$id',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{'Authorization': token},
            extra: _extra),
        data: _data);
    final value = WrappedResponse.fromJson(_result.data);
    return Future.value(value);
  }
}
