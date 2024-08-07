import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/Features/home/data/Repos/home_repo_implementation.dart';
import 'package:movie_app/core/helper/api.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<Dio>(
    Dio(),
  );
  getIt.registerSingleton<Api>(
    Api(
      getIt<Dio>(),
    ),
  );
  getIt.registerSingleton<HomeRepoImplementation>(
    HomeRepoImplementation(
      getIt<Api>(),
    ),
  );
}
