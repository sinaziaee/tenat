import 'package:flutter/material.dart';
import 'package:tenat/widgets/custom_text.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomText(
        text: 'Authentication',
      ),
    );
  }
}
