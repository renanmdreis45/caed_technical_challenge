import 'package:caed_technical_challenge/core/resources/data_state.dart';
import 'package:caed_technical_challenge/domain/entities/box.dart';
import 'package:caed_technical_challenge/domain/repository/box_repository.dart';

class GetAllPackages {
  GetAllPackages({required BoxRepository repository}) : _repository = repository;

  final BoxRepository _repository;

  Future<DataState<BoxModel>> call() async {
    final box = await _repository.getBox();

    return box;
  }
}
