import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// A wrapper around CustomTransitionPage to handle breaking changes in go_router.
class AppCustomTransitionPage<T> extends CustomTransitionPage<T> {
  AppCustomTransitionPage({
    required Widget child,
    required Widget Function(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
    ) transitionsBuilder,
    LocalKey? key,
    String? name,
    Object? arguments,
    String? restorationId,
  }) : super(
          key: key,
          name: name,
          arguments: arguments,
          restorationId: restorationId,
          transitionsBuilder: transitionsBuilder,
          child: child,
        );
}
