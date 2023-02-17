import 'package:first_plat_app/appStyle/app_styles.dart';
import 'package:first_plat_app/screen/widget/cutom_textfield.dart';
import 'package:first_plat_app/ui/sigin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:page_transition/page_transition.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/reset-password.png'),
              Text(
                'Forgot\nPassword',
                style: TextStyle(
                    color: AppStyles.primaryColor,
                    fontFamily: 'boonhome',
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextfield(
                  icon: Icons.alternate_email,
                  obscureText: false,
                  hintText: 'Enter Gmail'),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                      color: AppStyles.primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Center(
                    child: Text(
                      'Reset Password',
                      style: TextStyle(color: AppStyles.pWihte, fontSize: 18.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: SigIn(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Center(
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                      text: 'Have an Account ?',
                      style: TextStyle(color: AppStyles.pBlack),
                    ),
                    TextSpan(
                      text: 'Login',
                      style: TextStyle(color: AppStyles.primaryColor),
                    )
                  ])),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
