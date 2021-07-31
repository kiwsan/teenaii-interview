// ignore: import_of_legacy_library_into_null_safe
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

// ignore: unused_import
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teenaii/core/network/rest_api_provider.dart';
import 'package:teenaii/features/category/data/repositories/category_repository_imlp.dart';
import 'package:teenaii/features/category/domain/repositories/category_repository.dart';
import 'package:teenaii/features/category/presentation/bloc/category_bloc.dart';
import 'package:teenaii/features/home/presentation/bloc/new_bloc.dart';
import 'package:teenaii/features/post/presentation/bloc/post_bloc.dart';

import 'core/network/network_info.dart';
import 'features/home/data/repositories/repositories.dart';
import 'features/home/domain/repositories/repositories.dart';
import 'features/post/data/repositories/repositories.dart';
import 'features/post/domain/repositories/repositories.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Home
  // Bloc
  sl.registerFactory(
    () => PostBloc(postRepository: sl()),
  );
  sl.registerFactory(
    () => CategoryBloc(categoryRepository: sl()),
  );
  sl.registerFactory(
    () => NewBloc(newRepository: sl()),
  );

  // Use cases

  // Repository
  sl.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(httpClient: sl()),
  );
  sl.registerLazySingleton<NewRepository>(
    () => NewRepositoryImpl(httpClient: sl()),
  );
  sl.registerLazySingleton<PostRepository>(
    () => PostRepositoryImpl(httpClient: sl()),
  );

  // Data sources

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(dataConnectionChecker: sl()),
  );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => RestApiProvider(httpClient: sl()));
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
