import 'package:flutter/material.dart';
import 'package:flutter_codespace_practice/pages/home/home_page.dart';
import 'package:flutter_codespace_practice/pages/web_view_page.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.home:
        return pageRoute(HomePage(),settings:settings);
      case RoutePaths.webViewPage:
        return pageRoute(WebViewPage(title: 'zzz',),settings:settings);
      default:
        return pageRoute(
          Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          )
        );
    }
    
  }
  static MaterialPageRoute pageRoute(
    Widget page,
    {RouteSettings? settings,
      bool? fullscreenDialog = false,
      bool? maintainState = true,
      bool? allowSnapshotting = true
    }
  ) {
    return MaterialPageRoute(builder: (_) => page,settings: settings,);
  }
}

class RoutePaths {
  static const String home = '/';
  static const String webViewPage = '/web_view_page';
}