import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  final Widget? child;
  final Color? scaffoldColor;
  const BaseScaffold({this.child, this.scaffoldColor, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffoldColor,
        body: Center(
          child: child,
        ),
      ),
    );
  }
}
