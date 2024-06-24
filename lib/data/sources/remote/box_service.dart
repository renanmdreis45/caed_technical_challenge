import 'package:caed_technical_challenge/core/preferences/app_constants.dart';
import 'package:caed_technical_challenge/domain/entities/box.dart';
import 'package:caed_technical_challenge/domain/entities/models/package.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'box_service.g.dart';

@RestApi(baseUrl: packagesApiBaseUrl)
abstract class BoxService {
  factory BoxService(Dio dio) = _BoxService;

  @GET('/packages')
  Future<HttpResponse<BoxModel>> getBox();
}
