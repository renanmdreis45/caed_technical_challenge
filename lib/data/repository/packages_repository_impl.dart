import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../../core/preferences/app_constants.dart';

@RestApi(baseUrl: packagesApi)
abstract class PackagesService {
  factory PackagesService(Dio dio ) = 


  @GET('/packages')
  Future<HttpResponse<List>>
}