// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_router.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiRouter implements ApiRouter {
  _ApiRouter(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://gorest.co.in/public-api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ResponseData> getUsers() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ResponseData>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/users',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResponseData.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
