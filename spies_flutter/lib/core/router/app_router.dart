import 'package:auto_route/auto_route.dart';
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
          path: '/home',
          page: HomeRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
          children: [
            CustomRoute(
              path: 'main',
              page: MainRoute.page,
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),
          ],
        ),
      ];

  @override
  List<AutoRouteGuard> get guards => [];
}
