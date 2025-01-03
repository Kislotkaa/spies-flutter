import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spies/core/router/app_router.dart';
import 'package:spies/core/services/theme/theme_cubit.dart';
import 'package:spies/core/widgets/button_widget.dart';
import 'package:spies/core/widgets/text_field_widget.dart';
import 'package:spies/feature/home/presentation/bloc/home_bloc.dart';
import 'package:spies/locator.dart';

@RoutePage()
class WhereIsConnectPage extends StatefulWidget {
  const WhereIsConnectPage({super.key, this.ipInitial, this.nameInitial});

  final String? ipInitial;
  final String? nameInitial;

  @override
  State<WhereIsConnectPage> createState() => _WhereIsConnectPageState();
}

class _WhereIsConnectPageState extends State<WhereIsConnectPage> {
  final name = TextEditingController();
  final ip1 = TextEditingController();
  final ip2 = TextEditingController();
  final ip3 = TextEditingController();
  final ip4 = TextEditingController();

  final focusNodes = <int, FocusNode>{
    0: FocusNode(),
    1: FocusNode(),
    2: FocusNode(),
    3: FocusNode(),
    4: FocusNode(),
  };

  @override
  void initState() {
    final ipList = widget.ipInitial?.split('.');
    ip1.text = ipList?[0] ?? '';
    ip2.text = ipList?[1] ?? '';
    ip3.text = ipList?[2] ?? '';
    ip4.text = ipList?[3] ?? '';
    name.text = widget.nameInitial ?? '';
    super.initState();
  }

  void clearIp() {
    ip1.clear();
    ip2.clear();
    ip3.clear();
    ip4.clear();
  }

  void onChanged(int index, String value) {
    if (value.length == 3) focusNodes[index + 1]?.nextFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: appTheme.revertBasicColor.withOpacity(0.2),
              blurRadius: 32,
              spreadRadius: 0,
              offset: Offset(0, 8),
            ),
          ],
          color: appTheme.basicColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Подключиться к игре',
                    style: appTheme.textTheme.bodyExtrabold20,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'Введите ваше имя и IP хоста',
                      style: appTheme.textTheme.bodySemibold16.copyWith(color: appTheme.textGrayColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFieldWidget(
                      hintText: '0',
                      focusNode: focusNodes[0],
                      onChanged: (value) => onChanged(0, value),
                      textAlign: TextAlign.center,
                      type: TextInputType.number,
                      maxLength: 3,
                      controller: ip1,
                    ),
                  ),
                  Text(' . ', style: appTheme.textTheme.bodySemibold16),
                  Expanded(
                    child: TextFieldWidget(
                      hintText: '0',
                      focusNode: focusNodes[1],
                      onChanged: (value) => onChanged(1, value),
                      textAlign: TextAlign.center,
                      type: TextInputType.number,
                      maxLength: 3,
                      controller: ip2,
                    ),
                  ),
                  Text(' . ', style: appTheme.textTheme.bodySemibold16),
                  Expanded(
                    child: TextFieldWidget(
                      hintText: '0',
                      focusNode: focusNodes[2],
                      onChanged: (value) => onChanged(2, value),
                      textAlign: TextAlign.center,
                      type: TextInputType.number,
                      maxLength: 3,
                      controller: ip3,
                    ),
                  ),
                  Text(' . ', style: appTheme.textTheme.bodySemibold16),
                  Expanded(
                    child: TextFieldWidget(
                      hintText: '0',
                      focusNode: focusNodes[3],
                      onChanged: (value) => onChanged(3, value),
                      textAlign: TextAlign.center,
                      type: TextInputType.number,
                      maxLength: 3,
                      controller: ip4,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFieldWidget(
                hintText: 'Имя игрока',
                controller: name,
                focusNode: focusNodes[4],
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ButtonWidget(
                onTap: () {
                  router.removeLast();
                  sl<HomeBloc>().add(HomeConnectGameEvent(
                    playerName: name.text,
                    ip: '${ip1.text}.${ip2.text}.${ip3.text}.${ip4.text}',
                  ));
                },
                text: 'Подключиться',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
