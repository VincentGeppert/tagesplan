import 'package:flutter/material.dart';
import 'package:tagesplan/presentation/pages/time_table.dart';
import 'package:tagesplan/presentation/widgets/sidebar.dart';

class AppRouter {
  Route? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Sidebar());
      // case '/login':
      //   return MaterialPageRoute(builder: (_) => Settings());
      //   break;
      default:
        return null;
    }
  }
}
