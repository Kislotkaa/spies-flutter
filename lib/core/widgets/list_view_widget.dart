import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    super.key,
    required this.children,
    this.elementPadding,
    this.padding,
    this.physics,
    this.isExpaned = false,
    this.withStapAnimation = true,
  });
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? elementPadding;
  final EdgeInsetsGeometry? padding;
  final List<Widget> children;
  final bool isExpaned;
  final bool withStapAnimation;

  @override
  Widget build(BuildContext context) {
    final listWidget = ListView.builder(
      padding: padding,
      itemCount: children.length,
      physics: physics,
      itemBuilder: (BuildContext context, int i) {
        return _ElementListView(
          padding: elementPadding,
          index: i,
          withStapAnimation: withStapAnimation,
          child: children[i],
        );
      },
    );
    if (isExpaned) return Expanded(child: listWidget);
    return listWidget;
  }
}

class _ElementListView extends StatefulWidget {
  const _ElementListView({
    required this.child,
    required this.index,
    required this.withStapAnimation,
    this.padding,
  });

  final EdgeInsetsGeometry? padding;
  final int index;
  final Widget child;
  final bool withStapAnimation;

  @override
  State<_ElementListView> createState() => __ElementListViewState();
}

class __ElementListViewState extends State<_ElementListView> {
  static bool _isView = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: widget.withStapAnimation ? widget.index * 50 : 150)).then((_) {
      setState(() => _isView = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _isView ? 1 : 0,
      duration: Durations.medium1,
      child: Padding(
        padding: widget.padding ?? EdgeInsets.zero,
        child: widget.child,
      ),
    );
  }
}
