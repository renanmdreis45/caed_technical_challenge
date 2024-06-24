import 'package:caed_technical_challenge/data/repository/box_repository_impl.dart';
import 'package:caed_technical_challenge/data/sources/remote/box_service.dart';
import 'package:caed_technical_challenge/domain/repository/box_repository.dart';
import 'package:caed_technical_challenge/domain/usecase/get_box.dart';
import 'package:caed_technical_challenge/presentation/view/view_model/bloc/box/box_bloc.dart';
import 'package:caed_technical_challenge/presentation/view/view_model/bloc/login/login_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //Dio
  sl.registerSingleton<Dio>(Dio());

  //Service
  sl.registerSingleton<BoxService>(BoxService(sl()));

  //Repository
  sl.registerSingleton<BoxRepository>(BoxRepositoryImpl(sl()));

  //Bloc
  sl.registerFactory<BoxBloc>(() => BoxBloc(sl()));
  sl.registerFactory<LoginBloc>(() => LoginBloc());

  //Use case
  sl.registerLazySingleton<GetAllPackages>(() => GetAllPackages(repository: sl()));
}
