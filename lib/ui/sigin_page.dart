import 'package:first_plat_app/appStyle/app_styles.dart';
import 'package:first_plat_app/appStyle/constants.dart';
import 'package:first_plat_app/screen/widget/cutom_textfield.dart';
import 'package:first_plat_app/ui/forgot_password.dart';
import 'package:first_plat_app/ui/root_page.dart';
import 'package:first_plat_app/ui/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:page_transition/page_transition.dart';

class SigIn extends StatelessWidget {
  const SigIn({super.key});

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
              Image.asset('assets/images/signin.png'),
              Text(
                'Sign In',
                style: AppStyles().titleH4,
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextfield(
                obscureText: false,
                icon: Icons.alternate_email,
                hintText: 'Enter username',
              ),
              CustomTextfield(
                  icon: Icons.lock,
                  obscureText: true,
                  hintText: 'Enter Password'),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: RootPage(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    color: AppStyles.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Center(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          color: AppStyles.pWihte,
                          fontSize: 18.0,
                          fontFamily: 'boonhome'),
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
                          child: ForgotPassword(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Center(
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: 'Forgot Password ?',
                        style: TextStyle(color: AppStyles.pBlack),
                      ),
                      TextSpan(
                        text: ' Reset Here',
                        style: TextStyle(color: AppStyles.primaryColor),
                      )
                    ]),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('OR'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: size.width,
                decoration: BoxDecoration(
                  border: Border.all(color: AppStyles.primaryColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: 30,
                      child: Image.asset('assets/images/google.png'),
                    ),
                    Text(
                      'Signin with google',
                      style: TextStyle(color: AppStyles.pBlack, fontSize: 18.0),
                    )
                  ],
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
                          child: SignUp(),
                          type: PageTransitionType.bottomToTop));
                },
                child: Center(
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: 'New to Planty ',
                        style: TextStyle(color: AppStyles.pBlack),
                      ),
                      TextSpan(
                        text: 'Register',
                        style: TextStyle(color: AppStyles.primaryColor),
                      ),
                    ]),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
