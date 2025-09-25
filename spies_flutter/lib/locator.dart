import 'package:get_it/get_it.dart';
import 'package:sample/core/providers/local_data_provider.dart';
import 'package:sample/core/providers/remote_data_provider.dart';
import 'package:sample/core/repositories/auth_repository.dart';
import 'package:sample/core/router/app_router.dart';
import 'package:sample/core/cubits/intl_cubit.dart';
import 'package:sample/core/repositories/intl_repository.dart';
import 'package:sample/core/cubits/snackbar_cubit.dart';
import 'package:sample/core/repositories/theme_repository.dart';
import 'package:sample/core/cubits/theme_cubit.dart';
import 'package:sample/core/utils/device_extension.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> initLocator() async {
  await DeviceExtension.init();
  final sharedPreferences = await SharedPreferences.getInstance();

  // --- Providers --- \\
  sl.registerLazySingleton(() => LocalDataProvider(sharedPreferences));
  sl.registerLazySingleton(() => RemoteDataProvider());

  // --- Cubits --- \\
  sl.registerLazySingleton(() => ThemeCubit(sl()));
  sl.registerLazySingleton(() => IntlCubit(sl()));
  sl.registerLazySingleton(() => SnackBarCubit());

  // --- Repositories --- \\
  sl.registerLazySingleton<ThemeRepository>(() => ThemeRepository(sl()));
  sl.registerLazySingleton<IntlRepository>(() => IntlRepository(sl()));
  sl.registerLazySingleton<UserRepository>(() => UserRepository(sl(), sl()));

  // --- Other --- \\
  sl.registerLazySingleton(() => AppRouter());
}
