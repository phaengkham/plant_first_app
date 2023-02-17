import 'package:first_plat_app/appStyle/app_styles.dart';
import 'package:first_plat_app/screen/widget/profile_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16),
        height: size.height,
        width: size.width,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 150,
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.transparent,
                backgroundImage: ExactAssetImage('assets/images/profile.jpg'),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: AppStyles.primaryColor.withOpacity(.5), width: 5.0),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: size.width * .3,
              child: Row(
                children: [
                  Text(
                    'PHBABY',
                    style: AppStyles().titleH6,
                  ),
                  SizedBox(
                    height: 18,
                    child: Image.asset('assets/images/verified.png'),
                  ),
                ],
              ),
            ),
            Text(
              'baby@gmail.com',
              style: TextStyle(
                color: AppStyles.pBlack.withOpacity(.3),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: size.height * .7,
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  profileWidget(icon: Icons.person, title: 'Profile'),
                  profileWidget(icon: Icons.settings, title: 'Setting'),
                  profileWidget(
                      icon: Icons.notifications, title: 'Notification'),
                  profileWidget(icon: Icons.chat, title: 'FAQs'),
                  profileWidget(icon: Icons.share, title: 'Share'),
                  profileWidget(icon: Icons.logout, title: 'Log Out'),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
