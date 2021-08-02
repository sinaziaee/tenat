import 'package:flutter/cupertino.dart';
import 'package:tenat/constants/controllers.dart';
import 'package:tenat/routing/router.dart';
import 'package:tenat/routing/routes.dart';

Navigator localNavigator() =>   Navigator(
      key: navigationController.navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: overviewPageRoute,
    );



