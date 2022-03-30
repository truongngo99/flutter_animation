import 'package:flutter/material.dart';

class CustomPageRouter<T> extends PageRouteBuilder<T> {
  final Widget child;
  final Offset begin;
  final Duration duration;
  CustomPageRouter({
    required this.child,
    this.begin = const Offset(-1, 0),
    this.duration = const Duration(milliseconds: 500),
  }) : super(
            transitionDuration: duration,
            pageBuilder: (context, animation, animationSeconds) => child,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const end = Offset.zero;
              const curve = Curves.easeIn;
              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            });
}
