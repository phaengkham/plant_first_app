import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:first_plat_app/appStyle/app_styles.dart';
import 'package:first_plat_app/screen/cart_page.dart';
import 'package:first_plat_app/screen/farorite_page.dart';
import 'package:first_plat_app/screen/home_page.dart';
import 'package:first_plat_app/screen/profile_page.dart';
import 'package:first_plat_app/ui/login_page.dart';
import 'package:first_plat_app/ui/scan_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:page_transition/page_transition.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _bottomNavIndex = 0;
  List<Widget> page = const [
    HomePage(),
    FavoritePage(),
    ProfilePage(),
    CartPage()
  ];
  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person,
  ];
  List<String> titleList = [
    'Home',
    'Favorite',
    'Cart',
    'Profile',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleList[_bottomNavIndex],
              style: AppStyles().appbarTitleH3,
            ),
            Icon(
              Icons.notifications,
              color: AppStyles.pBlack,
              size: 30.0,
            ),
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: page,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
                child: ScanPage(), type: PageTransitionType.bottomToTop),
          );
        },
        child: Image.asset(
          'assets/images/code-scan-two.png',
          height: 30.0,
        ),
        backgroundColor: AppStyles.primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: iconList,
          splashColor: AppStyles.primaryColor,
          inactiveColor: AppStyles.pBlack.withOpacity(.5),
          activeColor: AppStyles.primaryColor,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (index) {
            setState(() {
              _bottomNavIndex = index;
            });
          }),
    );
  }
}
