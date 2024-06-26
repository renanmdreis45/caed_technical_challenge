import 'package:caed_technical_challenge/core/resources/data_state.dart';
import 'package:caed_technical_challenge/domain/entities/box.dart';

abstract class BoxRepository {
  Future<DataState<BoxModel>> getBox();
}
