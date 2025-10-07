import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sample/src/widgets/appbar_widget.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(title: 'Main Screen'),
      body: Center(
        child: Text('Main page'),
      ),
    );
  }
}
