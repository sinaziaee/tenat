import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tenat/helpers/responsiveness.dart';
import 'package:tenat/widgets/large_screen.dart';
import 'package:tenat/widgets/small_screen.dart';
import 'package:tenat/widgets/top_nav_bar.dart';

import 'widgets/side_menu.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: topNavigationBar(context, scaffoldKey),
      drawer: Drawer(
        child: SideMenu(),
      ),
      body: ResponsiveWidget(
        largeScreen: LargeScreen(),
        smallScreen: SmallScreen(),
      ),
    );
  }
}
