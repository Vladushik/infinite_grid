import 'package:get_it/get_it.dart';
import 'package:infinite_grid/src/features/home/bloc/home_bloc.dart';

import 'package:infinite_grid/src/features/splash/bloc/splash_bloc.dart';
import 'package:infinite_grid/src/features/splash/data/repositories/splash_repository.dart';
import 'package:infinite_grid/src/features/auth/login/bloc/login_bloc.dart';
import 'package:infinite_grid/src/features/auth/login/data/repositories/login_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //MARK: - BLoCs
  sl.registerFactory(() => SplashBloc(repository: sl()));
  sl.registerFactory(() => LoginBloc(repository: sl()));
  sl.registerFactory(() => HomeBloc());
  //MARK: - Repositories
  sl.registerLazySingleton<SplashRepository>(() => SplashRepositoryImpl());
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl());
  //MARK: - Data sources
  //MARK: - Utils
  //MARK: - External
}
