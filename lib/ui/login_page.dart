import 'package:first_plat_app/appStyle/app_styles.dart';
import 'package:first_plat_app/appStyle/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        backgroundColor: AppStyles.primaryColor,
      ),
    );
  }
}
