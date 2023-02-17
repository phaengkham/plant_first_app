import 'package:first_plat_app/appStyle/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final IconData icon;
  final bool obscureText;
  final String hintText;
  const CustomTextfield({
    super.key,
    required this.icon,
    required this.obscureText,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: false,
      style: TextStyle(color: AppStyles.pBlack),
      decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            icon,
            color: AppStyles.pBlack.withOpacity(.3),
          ),
          hintText: hintText),
      cursorColor: AppStyles.pBlack.withOpacity(.5),
    );
  }
}
