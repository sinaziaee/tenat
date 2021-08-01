import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tenat/constants/controllers.dart';
import 'package:tenat/constants/styles.dart';
import 'package:tenat/helpers/responsiveness.dart';
import 'package:tenat/routing/routes.dart';
import 'package:tenat/widgets/custom_text.dart';
import 'package:tenat/widgets/side_menu_items.dart';
import '../routing/routes.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // return Container(
    //   color: light,
    //   child: ListView(
    //     children: [
    //       if(ResponsiveWidget.isSmallScreen(context))
    //         Column(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             SizedBox(
    //               height: 40,
    //             ),
    //             Row(
    //               children: [
    //                 SizedBox(width: width / 48),
    //                 Padding(
    //                   padding: const EdgeInsets.only(right: 12),
    //                   child: Image.asset("assets/icons/logo.png"),
    //                 ),
    //                 Flexible(
    //                   child: CustomText(
    //                     text: "Dash",
    //                     size: 20,
    //                     weight: FontWeight.bold,
    //                     color: active,
    //                   ),
    //                 ),
    //                 SizedBox(width: width / 48),
    //               ],
    //             ),
    //             SizedBox(
    //               height: 30,
    //             ),
    //           ],
    //         ),
    //       Divider(color: lightGrey.withOpacity(.1), ),
    //
    //       Column(
    //         mainAxisSize: MainAxisSize.min,
    //         children: sideMenuItems
    //             .map((item) => SideMenuItem(
    //             itemName: item.name,
    //             onTap: () {
    //               if(item.route == AuthenticationPageRoute){
    //                 // Get.offAllNamed(AuthenticationPageRoute);
    //                 // menuController.changeActiveItemTo(OverviewPageDisplayName);
    //
    //               }
    //               if (!menuController.isActive(item.name)) {
    //                 menuController.changeActiveItemTo(item.name);
    //                 if(ResponsiveWidget.isSmallScreen(context))
    //                   Get.back();
    //                 // navigationController.navigateTo(item.route);
    //               }
    //             }))
    //             .toList(),
    //       )
    //     ],
    //   ),
    // );
    return Container(
      color: light,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width / 48,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Image.asset('assets/icons/logo.png'),
                    ),
                    Flexible(
                      child: CustomText(
                        text: 'Dash',
                        size: 20,
                        weight: FontWeight.bold,
                        color: active,
                      ),
                    ),
                    SizedBox(
                      width: width / 48,
                    ),
                  ],
                ),
              ],
            ),
          SizedBox(
            height: 40,
          ),
          Divider(
            color: lightGrey.withOpacity(.1),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var itemName in sideMenuItems) ...[
                SideMenuItem(
                  itemName: itemName == AuthenticationPageRoute
                      ? 'Log Out'
                      : itemName,
                  onTap: () {
                    if (itemName == AuthenticationPageRoute) {}
                    if (!menuController.isActive(itemName)) {
                      menuController.changeActiveItemTo(itemName);
                      if (ResponsiveWidget.isSmallScreen(context)) {
                        Get.back();
                      }
                    }
                  },
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
