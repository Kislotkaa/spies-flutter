import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/core/gen/assets.gen.dart';
import 'package:sample/core/gen/l10n/generated/l10n.dart';
import 'package:sample/core/router/app_router.dart';
import 'package:sample/core/router/app_router.gr.dart';
import 'package:sample/core/utils/constants.dart';
import 'package:sample/core/utils/context_extension.dart';
import 'package:sample/presentation/settings/bloc/settings_bloc.dart';
import 'package:sample/presentation/settings/widgets/settinga_name_confirm_widget.dart';
import 'package:sample/presentation/settings/widgets/settings_group_widget.dart';
import 'package:sample/presentation/settings/widgets/settings_item_widget.dart';
import 'package:sample/src/cubits/theme_cubit.dart';
import 'package:sample/src/repositories/user_repository.dart';
import 'package:sample/src/widgets/appbar_widget.dart';
import 'package:sample/src/widgets/button_widget.dart';
import 'package:sample/src/widgets/icon_widget.dart';
import 'package:sample/src/widgets/snackbar_widget.dart';
import 'package:sample/src/widgets/switcher_widget.dart';
import 'package:sample/src/widgets/text_field_widget.dart';
import 'package:sample/src/widgets/version_widget.dart';
import 'package:url_launcher/url_launcher_string.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsBloc(
        context.read<UserRepository>(),
      )..add(SettingsInitialEvent()),
      child: const _SettingsView(),
    );
  }
}

class _SettingsView extends StatelessWidget {
  const _SettingsView();

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.read<ThemeCubit>();
    final bloc = context.read<SettingsBloc>();
    final colorTheme = context.colorTheme;
    final locale = S.of(context);

    return Scaffold(
      appBar: AppBarWidget(
        title: S.of(context).settingsTitle,
        needClose: true,
      ),
      body: BlocListener<SettingsBloc, SettingsState>(
        listener: (context, state) {
          if (state is SettingsLogoutSuccessState) {
            router.replaceAll([const AuthRoute()]);
          }
          if (state is SettingsSnackBarShownState) {
            SnackbarWidget.show(
              title: state.title,
              subTitle: state.subTitle,
              status: state.status,
              overlayState: Overlay.of(context),
            );
          }
        },
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            SettingsGroupWidget(
              title: locale.settingsMain,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: BlocBuilder<SettingsBloc, SettingsState>(
                        buildWhen: (previous, current) =>
                            current is SettingsUpdateState,
                        builder: (context, state) {
                          if (state is SettingsUpdateState) {
                            return Form(
                              key: state.formKey,
                              child: TextFieldWidget(
                                controller: state.nameController,
                                titleText: locale.settingsChangeNameTitle,
                                prefixIcon: IconWidget(
                                  icon: Assets.icons.userSquare,
                                ),
                                onChanged: (value) =>
                                    bloc.add(SettingsInputEvent()),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(20),
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[\p{L}\p{N}_]', unicode: true)),
                                ],
                                validator: (value) {
                                  if (value == null || value.length < 2) {
                                    return locale.nameNotValid;
                                  }

                                  return null;
                                },
                              ),
                            );
                          }

                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                    BlocBuilder<SettingsBloc, SettingsState>(
                      buildWhen: (previous, current) =>
                          current is SettingsSuffixShownState,
                      builder: (context, state) {
                        if (state is SettingsSuffixShownState &&
                            state.isShownSuffix) {
                          return SettingsNameConfirmWidget(
                            isLoading: state.isLoading,
                            onTap: () => bloc.add(SettingsChangeNameEvent()),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ],
                ),
                ButtonWidget(
                  onTap: () => router.push(const SuggestWordRoute()),
                  text: locale.settingsSuggestWord,
                  leftWidget: Assets.icons.faceScreaming.svg(),
                  withHapticFeedback: true,
                ),
              ],
            ),
            SettingsGroupWidget(
              title: locale.settingsAdditional,
              children: [
                SettingsItemWidget(
                  title: locale.settingsDarkTheme,
                  icon: Assets.icons.moon,
                  onTap: themeCubit.switchTheme,
                  action: BlocBuilder<ThemeCubit, ThemeState>(
                    builder: (context, state) => SwitcherWidget(
                      initialActive: state.isDarkMode,
                      callBack: (_) => themeCubit.switchTheme(),
                    ),
                  ),
                ),
                SettingsItemWidget(
                  title: locale.gameRulesTitle,
                  icon: Assets.icons.informationSquare,
                  onTap: () => router.push(const GameRulesRoute()),
                ),
                SettingsItemWidget(
                  title: locale.settingsPolit,
                  icon: Assets.icons.notebook,
                  onTap: () => launchUrlString(Constants.politUrl),
                ),
              ],
            ),
            SettingsGroupWidget(
              title: locale.settingsAccount,
              children: [
                SettingsItemWidget(
                  title: locale.settingsAccountDelete,
                  icon: Assets.icons.cancel,
                  onTap: () => bloc.add(SettingsLogoutEvent()),
                  color: colorTheme.redColor,
                ),
                const VersionWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
