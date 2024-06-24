import 'package:caed_technical_challenge/core/resources/data_state.dart';
import 'package:caed_technical_challenge/domain/usecase/get_box.dart';
import 'package:caed_technical_challenge/presentation/view/view_model/bloc/box/box_event.dart';
import 'package:caed_technical_challenge/presentation/view/view_model/bloc/box/box_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoxBloc extends Bloc<BoxEvent, BoxState> {
  final GetAllPackages _getAllPackages;

  BoxBloc(this._getAllPackages) : super(const BoxLoading()) {
    on<GetBox>(onGetBox);
  }

  void onGetBox(GetBox event, Emitter<BoxState> emit) async {
    final dataState = await _getAllPackages.call();

    if (dataState is DataSuccess && dataState.data!.toJson().isNotEmpty) {
      emit(BoxDone(dataState.data!));
    }

    if (dataState is DataError) {
      emit(BoxError(dataState.error!));
    }
  }
}
