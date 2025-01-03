import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spies/core/gen/assets.gen.dart';
import 'package:spies/core/router/app_router.dart';
import 'package:spies/core/router/app_router.gr.dart';
import 'package:spies/core/services/connectivity_service.dart';
import 'package:spies/core/services/permission_service.dart';
import 'package:spies/core/services/theme/theme_cubit.dart';
import 'package:spies/core/widgets/app_snackbar.dart';
import 'package:spies/core/widgets/appbar_widget.dart';
import 'package:spies/core/widgets/button_widget.dart';
import 'package:spies/core/widgets/icon_widget.dart';
import 'package:spies/core/widgets/version_widget.dart';
import 'package:spies/feature/home/presentation/bloc/home_bloc.dart';
import 'package:spies/feature/home/presentation/widgets/home_logo_background_widget.dart';
import 'package:spies/locator.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed((Duration(seconds: 1))).then((_) => PermissionService().init());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.snackbar != null) {
          AppSnackbar.showSnackBar(
            title: state.snackbar!.title,
            description: state.snackbar!.description,
            overlayState: Overlay.of(context),
            status: state.snackbar!.status,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBarWidget(
            title: 'Шпион',
            actions: [
              IconButtonWidget(
                icon: Assets.icons.setting,
                padding: EdgeInsets.all(16),
                withFeedback: true,
                onTap: () => router.push(SettingsRoute()),
              ),
            ],
          ),
          body: SafeArea(
            minimum: EdgeInsets.all(20),
            child: Stack(
              children: [
                HomeLogoBackgroundWidget(),
                Center(
                  child: StreamBuilder(
                      stream: sl<ConnectivityService>().stream,
                      builder: (context, data) {
                        final isAvailable = sl<ConnectivityService>().isWifiAvailable(data.data ?? []);
                        if (!isAvailable) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 32),
                            child: Text(
                              'Что бы начать игру\nнеобходимо подключиться к Wifi сети',
                              textAlign: TextAlign.center,
                              style: appTheme.textTheme.bodySemibold16
                                  .copyWith(color: appTheme.textGrayColor, height: 1.4),
                            ),
                          );
                        }

                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ButtonWidget(
                              onTap: () => sl<HomeBloc>().add(const HomeCreateGameEvent()),
                              text: 'Создать игру',
                              height: 80,
                              padding: EdgeInsets.only(bottom: 16),
                            ),
                            ButtonWidget(
                              onTap: () => sl<HomeBloc>().add(const HomeWhereIsConnectEvent()),
                              text: 'Присоединиться',
                              height: 60,
                              baseButtonEnum: BaseButtonEnum.outline,
                            ),
                          ],
                        );
                      }),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: VersionWidget(),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
