import 'package:flutter/material.dart';
import 'package:tenat/constants/controllers.dart';
import 'package:tenat/routing/router.dart';
import 'package:tenat/routing/routes.dart';

Navigator localNavigator() {
  return Navigator(
    key: navigationController.navigateKey,
    initialRoute: OverViewPageRoute,
    onGenerateRoute: generateRoute,
  );
}
