import 'package:flutter/material.dart';

class SlidePageRoute extends PageRouteBuilder {
  final Widget page;
  final Tween<Offset> tween;
  SlidePageRoute({
    required this.page,
    required this.tween,
  }) : super(
          pageBuilder: (BuildContext context, Animation<double> istAnimation,
                  Animation<double> secAnimation) =>
              page,
          transitionsBuilder: (BuildContext context,
                  Animation<double> istAnimation,
                  Animation<double> secAnimation,
                  Widget child) =>
              SlideTransition(
            position: tween.animate(istAnimation),
            child: child,
          ),
          transitionDuration: const Duration(milliseconds: 200),
        );
}
