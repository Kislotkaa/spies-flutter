import 'package:auto_route/auto_route.dart';
import 'package:sample/core/models/theme/colors.dart';
import 'package:sample/core/router/app_router.gr.dart';

final router = AppRouter();

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          path: '/splash',
          page: SplashRoute.page,
          initial: true,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          path: '/auth',
          page: AuthRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          path: '/appDialog',
          page: AppDialogRoute.page,
          barrierColor: AppStaticColors.barierColor,
          transitionsBuilder: TransitionsBuilders.fadeIn,
          opaque: false,
          barrierDismissible: true,
        ),
        CustomRoute(
          path: '/main',
          page: MainRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          path: '/settings',
          page: SettingsRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
        ),
        CustomRoute(
          path: '/suggestWord',
          page: SuggestWordRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          path: '/createGame',
          page: CreateGameRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
        CustomRoute(
          path: '/game',
          page: GameRoute.page,
          transitionsBuilder: TransitionsBuilders.fadeIn,
        ),
      ];

  @override
  List<AutoRouteGuard> get guards => [];
}
