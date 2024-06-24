import 'dart:io';

import 'package:caed_technical_challenge/core/resources/data_state.dart';
import 'package:caed_technical_challenge/data/sources/remote/box_service.dart';
import 'package:caed_technical_challenge/domain/entities/box.dart';
import 'package:caed_technical_challenge/domain/repository/box_repository.dart';
import 'package:dio/dio.dart';

class BoxRepositoryImpl implements BoxRepository {
  final BoxService _boxService;

  BoxRepositoryImpl(this._boxService);

  @override
  Future<DataState<BoxModel>> getBox() async {
    try {
      final httpResponse = await _boxService.getBox();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataError(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataError(e);
    }
  }
}
