part of 'box_service.dart';

class _BoxService implements BoxService {
  _BoxService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://packages.free.beeceptor.com/packages';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<BoxModel>> getBox() async {
    final _result = await _dio.get(baseUrl ?? _dio.options.baseUrl);

    BoxModel value = BoxModel.fromJson(_result.data as Map<String, dynamic>);

    print(value);

    final httpResponse = HttpResponse(value, _result);

    return httpResponse;
  }
}
