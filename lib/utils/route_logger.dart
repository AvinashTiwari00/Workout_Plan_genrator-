import 'package:flutter/material.dart';

class RouteLogger extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _logEvent(
      action: 'PUSH',
      route: route,
      previousRoute: previousRoute,
    );
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    _logEvent(
      action: 'POP',
      route: previousRoute,
      previousRoute: route,
    );
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    _logEvent(
      action: 'REPLACE',
      route: newRoute,
      previousRoute: oldRoute,
    );
  }

  void _logEvent({
    required String action,
    Route<dynamic>? route,
    Route<dynamic>? previousRoute,
  }) {
    final String routeName = route?.settings.name ?? 'null';
    final String previousRouteName = previousRoute?.settings.name ?? 'null';

    debugPrint('''
==============================
📍 Navigation Event
Action: $action
Route: $routeName
Previous Route: $previousRouteName
==============================
''');
  }
}
