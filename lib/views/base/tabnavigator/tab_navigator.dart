import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final Widget child;

  const TabNavigator({
    Key? key,
    required this.navigatorKey,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (settings) {
        return GetPageRoute(
          page: () => child,
          settings: settings,
          popGesture: true,
          fullscreenDialog: false,
        );
      },
      observers: [GetObserver()],
    );
  }
}
