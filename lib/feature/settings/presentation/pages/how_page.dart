import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:spies/core/widgets/appbar_widget.dart';

@RoutePage()
class HowPage extends StatelessWidget {
  const HowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Как пользоваться?',
        needClose: true,
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(20),
        child: Center(
          child: Text('Как пользоваться?'),
        ),
      ),
    );
  }
}
