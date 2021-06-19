import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget Function(BuildContext context, Size size) builder;
  final Color? backgroundColor;
  final AppBar? appBar;
  final Drawer? drawer;
  final bool resizeToAvoidBottomInset;

  const ResponsiveWidget(
      {Key? key,
      required this.builder,
      this.appBar,
      this.drawer,
      this.backgroundColor,
      this.resizeToAvoidBottomInset = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      Size constraints = Size(constraint.maxWidth, constraint.maxHeight);
      return Scaffold(
        backgroundColor: backgroundColor ?? Theme.of(context).backgroundColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        appBar: appBar,
        drawer: drawer,
        body: Builder(
          builder: (context) => builder(context, constraints),
        ),
      );
    });
  }
}
