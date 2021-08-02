import 'package:flutter/material.dart';
import 'package:tenat/pages/clients/clients.dart';
import 'package:tenat/pages/drivers/drivers.dart';
import 'package:tenat/pages/graph/graph.dart';
import 'package:tenat/pages/graph/graph2.dart';
import 'package:tenat/pages/overview/overview.dart';
import 'package:tenat/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case overviewPageRoute:
      return _getPageRoute(OverviewPage());
    case driversPageRoute:
      return _getPageRoute(DriversPage());
    case clientsPageRoute:
      return _getPageRoute(ClientsPage());
    case graphPageRoute:
      // return _getPageRoute(GraphPage());
      return _getPageRoute(GraphScreen());
    default:
      return _getPageRoute(OverviewPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
