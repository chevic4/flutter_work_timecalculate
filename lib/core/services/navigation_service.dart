import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static void navigatePush(Widget page) => navigatorKey.currentState!
      .push(_navigateAnimationScaled(navigatorKey.currentContext!, page));

  static void navigatePop([dynamic result]) =>
      navigatorKey.currentState!.pop(result);

  static void navigateReplacemant(Widget page) {
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
    navigatorKey.currentState!.pushReplacement(
        _navigateAnimationScaled(navigatorKey.currentContext!, page));
  }
}

PageRouteBuilder _navigateAnimationScaled(BuildContext context, Widget page) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const curve = Curves.easeInOut;
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );
      return ScaleTransition(
        scale: Tween(begin: 0.0, end: 1.0).animate(curvedAnimation),
        child: page,
      );
    },
    pageBuilder: (context, animation, secondaryAnimation) => page,
  );
}
