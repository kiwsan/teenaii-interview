import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teenaii/core/util/tab_item.dart';
import 'package:teenaii/features/home/presentation/pages/home_page.dart';

class TabNavigatorRoutes {
  static const String home = '/';
  static const String job = '/job';
  static const String post = '/post';
  static const String profile = '/profile';
}

class TabNavigator extends StatelessWidget {
  TabNavigator({required this.navigatorKey, required this.tabItem});
  final GlobalKey<NavigatorState>? navigatorKey;
  final TabItem tabItem;

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context) {
    return {
      TabNavigatorRoutes.home: (context) => HomePage(
            title: tabName[tabItem]!,
            onPush: (materialIndex) => {},
          ),
    };
  }

  @override
  Widget build(BuildContext context) {
    final routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.home,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          builder: (context) => routeBuilders[routeSettings.name!]!(context),
        );
      },
    );
  }
}
