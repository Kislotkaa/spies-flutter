import 'package:auto_route/auto_route.dart';
import 'package:spies/core/router/app_router.gr.dart';
import 'package:spies/core/services/theme/theme_cubit.dart';
import 'package:spies/locator.dart';

AppRouter get router => sl<AppRouter>();

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          path: '/home',
          page: HomeRoute.page,
          initial: true,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          path: '/settings',
          page: SettingsRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
        ),
        CustomRoute(
          path: '/about',
          page: AboutRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
        ),
        CustomRoute(
          path: '/how',
          page: HowRoute.page,
          transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
        ),
        CustomRoute(
          path: '/game',
          page: GameRoute.page,
          transitionsBuilder: TransitionsBuilders.slideRightWithFade,
        ),
        CustomRoute(
          path: '/whereIsConnect',
          page: WhereIsConnectRoute.page,
          durationInMilliseconds: 150,
          opaque: false,
          barrierColor: appTheme.revertBasicColor.withOpacity(0.5),
          transitionsBuilder: TransitionsBuilders.zoomIn,
        ),
        CustomRoute(
          path: '/suggestWord',
          page: SuggestWordRoute.page,
          durationInMilliseconds: 150,
          opaque: false,
          barrierColor: appTheme.revertBasicColor.withOpacity(0.5),
          transitionsBuilder: TransitionsBuilders.zoomIn,
        ),
      ];

  @override
  List<AutoRouteGuard> get guards => [];
}
