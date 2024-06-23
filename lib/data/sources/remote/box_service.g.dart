part of 'box_service.dart';


class _BoxService implements BoxService{
  _BoxService(this._dio, {this.baseUrl}) {
    baseUrl ??= '';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<BoxModel>> getBox() async {


    final _result = await _dio.get(baseUrl ?? _dio.options.baseUrl);
     
    BoxModel value = BoxModel.fromJson(_result.data!['items'] as Map<String, dynamic>);
    
    final httpResponse = HttpResponse(value, _result);

    return httpResponse;
  }
}