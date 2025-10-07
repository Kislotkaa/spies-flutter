import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:sample/app.dart';
import 'package:sample/core/utils/device_extension.dart';
import 'package:sample/src/cubits/theme_cubit.dart';
import 'package:sample/src/cubits/intl_cubit.dart';
import 'package:sample/src/providers/local_data_provider.dart';
import 'package:sample/src/providers/remote_data_provider.dart';
import 'package:sample/src/repositories/intl_repository.dart';
import 'package:sample/src/repositories/theme_repository.dart';
import 'package:sample/src/repositories/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await DeviceExtension.init();
  final sharedPreferences = await SharedPreferences.getInstance();

  // --- Providers --- \\
  final localDataProvider = LocalDataProvider(sharedPreferences);
  final remoteDataProvider = RemoteDataProvider();

  // --- Repositories --- \\
  final themeRepository = ThemeRepository(localDataProvider);
  final intlRepository = IntlRepository(localDataProvider);

  final userRepository = UserRepository(
    remoteDataProvider,
    localDataProvider,
  );

  FlutterNativeSplash.remove();

  runApp(
    MultiBlocProvider(
      providers: [
        // --- Providers --- \\
        RepositoryProvider(create: (_) => localDataProvider),
        RepositoryProvider(create: (_) => remoteDataProvider),

        // --- Repositories --- \\
        RepositoryProvider(create: (_) => themeRepository),
        RepositoryProvider(create: (_) => intlRepository),
        RepositoryProvider(create: (_) => userRepository),

        // --- Cubits --- \\
        BlocProvider(create: (_) => ThemeCubit(themeRepository)),
        BlocProvider(create: (_) => IntlCubit(intlRepository)),
      ],
      child: const App(),
    ),
  );
}
