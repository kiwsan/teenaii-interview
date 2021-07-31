// ignore: import_of_legacy_library_into_null_safe
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teenaii/features/category/presentation/bloc/category_bloc.dart';
import 'package:teenaii/features/home/presentation/bloc/new_bloc.dart';
import 'package:teenaii/features/post/presentation/bloc/post_bloc.dart';

import 'core/network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Home
  // Bloc
  sl.registerFactory(
    () => PostBloc(httpClient: sl()),
  );
  sl.registerFactory(
    () => CategoryBloc(httpClient: sl()),
  );
  sl.registerFactory(
    () => NewBloc(httpClient: sl()),
  );

  // Use cases

  // Repository

  // Data sources

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(dataConnectionChecker: sl()),
  );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
