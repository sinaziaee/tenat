import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tenat/constants/styles.dart';
import 'package:tenat/routing/routes.dart';

class MenuController extends GetxController {
  static MenuController instance = Get
      .find(); // an instance to that will allow us to access the value of menuController from anywhere inside of our code

  var activeItem = OverViewPageRoute.obs;
  var hoverItem = "".obs;

  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isActive(String itemName) {
    return activeItem.value == itemName;
  }

  isHovering(String itemName) {
    return hoverItem.value == itemName;
  }

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case OverViewPageRoute:
        return customIcon(Icons.trending_up, itemName);
      case DriversPageRoute:
        return customIcon(Icons.drive_eta, itemName);
      case ClientsPageRoute:
        return customIcon(Icons.people_alt_outlined, itemName);
      case AuthenticationPageRoute:
        return customIcon(Icons.exit_to_app, itemName);
      default:
        return customIcon(Icons.exit_to_app, itemName);
    }
    return Container();
  }

  Widget customIcon(IconData icon, String itemName) {
    if (isActive(itemName))
      return Icon(
        icon,
        size: 22,
        color: dark,
      );
    return Icon(icon, color: isHovering(itemName) ? dark : lightGrey);
  }
}
