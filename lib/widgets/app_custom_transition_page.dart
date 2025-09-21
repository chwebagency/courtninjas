import 'package:go_router/go_router.dart';

// A wrapper around CustomTransitionPage to handle breaking changes in go_router.
class AppCustomTransitionPage<T> extends CustomTransitionPage<T> {
  const AppCustomTransitionPage({
    required super.child,
    required super.transitionsBuilder,
    super.key,
    super.name,
    super.arguments,
    super.restorationId,
  });
}
