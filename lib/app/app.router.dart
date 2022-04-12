// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../ui/views/timeTable/time_table.dart';

class Routes {
  static const String timeTable = '/';
  static const all = <String>{
    timeTable,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.timeTable, page: TimeTable),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    TimeTable: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => TimeTable(),
        settings: data,
      );
    },
  };
}
