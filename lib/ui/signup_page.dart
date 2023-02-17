import 'package:first_plat_app/appStyle/app_styles.dart';
import 'package:first_plat_app/screen/widget/cutom_textfield.dart';
import 'package:first_plat_app/ui/sigin_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
            Image.asset('assets/images/signup.png'),
            Text(
              'Sign Up',
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
                icon: Icons.email, obscureText: false, hintText: 'gmail.com'),
            CustomTextfield(
                icon: Icons.person,
                obscureText: false,
                hintText: 'Enter Full Name'),
            CustomTextfield(
                icon: Icons.lock,
                obscureText: false,
                hintText: 'Enter Password'),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                  color: AppStyles.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: AppStyles.pWihte, fontSize: 18.0),
                  ),
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
                Expanded(child: Divider())
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
                    'Sign Up With Google',
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
                        child: SigIn(), type: PageTransitionType.bottomToTop));
              },
              child: Center(
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                    text: 'Have an Account ?',
                    style: TextStyle(color: AppStyles.pBlack),
                  ),
                  TextSpan(
                    text: 'LogIn',
                    style: TextStyle(color: AppStyles.primaryColor),
                  )
                ])),
              ),
            )
          ],
        )),
      ),
    );
  }
}
