import 'package:caed_technical_challenge/domain/entities/box.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

abstract class BoxState extends Equatable {
  final BoxModel? box;
  final DioException? error;

  const BoxState({this.box, this.error});

  @override
  List<Object> get props => [box!];
}

class BoxLoading extends BoxState {
  const BoxLoading();
}

class BoxDone extends BoxState {
  const BoxDone(BoxModel box) : super(box: box);
}

class BoxError extends BoxState {
  const BoxError(DioException error) : super(error: error);
}
