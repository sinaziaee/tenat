import 'package:flutter/material.dart';
import 'package:tenat/pages/authentication/authentication.dart';
import 'package:tenat/pages/clients/clients.dart';
import 'package:tenat/pages/drivers/drivers.dart';
import 'package:tenat/routing/routes.dart';
import 'package:tenat/pages/overview/overview.dart';
import 'package:tenat/routing/routes.dart';

// returns
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OverViewPageRoute:
      return getPageRoute(OverViewPage());
    case DriversPageRoute:
      return getPageRoute(DriversPage());
    case ClientsPageRoute:
      return getPageRoute(ClientsPage());
    case AuthenticationPageRoute:
      return getPageRoute(AuthenticationPage());
    default:
      return getPageRoute(OverViewPage());
  }
}

PageRoute getPageRoute(Widget child) {
  return MaterialPageRoute(
    builder: (context) {
      return child;
    },
  );
}
