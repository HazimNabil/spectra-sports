import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:spectra_sports/core/network/api_service.dart';
import 'package:spectra_sports/features/admin/home/data/repos/admin_home_repo_impl.dart';
import 'package:spectra_sports/features/auth/data/repos/auth_repo_impl.dart';
import 'package:spectra_sports/features/coach/home/data/repos/coach_home_repo_impl.dart';

final locator = GetIt.instance;

void setupServiceLocator() {
  locator.registerSingleton(Dio());

  locator.registerLazySingleton(
    () => ApiService(locator<Dio>()),
  );

  locator.registerLazySingleton(
    () => AuthRepoImpl(locator<ApiService>()),
  );

  locator.registerLazySingleton(
    () => AdminHomeRepoImpl(locator<ApiService>()),
  );

  locator.registerLazySingleton(
    () => CoachHomeRepoImpl(locator<ApiService>()),
  );
}
