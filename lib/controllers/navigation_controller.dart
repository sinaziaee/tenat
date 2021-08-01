import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController{
  static NavigationController instance = Get.find();
  final GlobalKey<NavigatorState> navigateKey = GlobalKey(); // to use local navigator for app to know which navigator we're going to change screen

  Future<dynamic> navigateTo(String route){
    return navigateKey.currentState!.pushNamed(route); // adding null check to the target
  }

  goBack(){
    return navigateKey.currentState!.pop();
  }
}