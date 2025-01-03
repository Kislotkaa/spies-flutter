import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spies/core/router/app_router.dart';
import 'package:spies/core/services/connectivity_service.dart';
import 'package:spies/core/services/game/client_service.dart';
import 'package:spies/core/services/game/repository/theme_repository.dart';
import 'package:spies/core/services/game/server_service.dart';
import 'package:spies/core/services/theme/repository/theme_repository.dart';
import 'package:spies/core/services/theme/theme_cubit.dart';
import 'package:spies/feature/game/presentation/bloc/game/game_bloc.dart';
import 'package:spies/feature/game/presentation/bloc/on_client/on_client_cubit.dart';
import 'package:spies/feature/game/presentation/bloc/on_server/on_server_cubit.dart';
import 'package:spies/feature/home/presentation/bloc/home_bloc.dart';

final sl = GetIt.instance;

Future<void> initLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  // --- Cubit --- \\
  sl.registerLazySingleton(() => ThemeCubit(themeRepository: sl()));
  sl.registerLazySingleton(() => OnClientCubit(serverService: sl()));
  sl.registerLazySingleton(() => OnServerCubit(clientService: sl()));

  // --- Bloc --- \\
  sl.registerLazySingleton(() => HomeBloc(userRepository: sl(), clientService: sl(), serverService: sl()));
  sl.registerLazySingleton(() => GameBloc(serverService: sl(), clientService: sl()));

  // --- Repositories --- \\
  sl.registerLazySingleton<ThemeRepository>(
    () => ThemeRepositoryImpl(sharedPreferences: sharedPreferences),
  );
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(sharedPreferences: sharedPreferences),
  );

  // --- Other --- \\
  sl.registerLazySingleton(() => ClientService());
  sl.registerLazySingleton(() => ServerService());
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => AppRouter());
  sl.registerLazySingleton(() => ConnectivityService());

  // Что то инициализируем
  sl<OnServerCubit>().listenServerData();
  sl<OnClientCubit>().listenClientData();

}
