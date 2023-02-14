import 'package:first_plat_app/appStyle/app_styles.dart';
import 'package:first_plat_app/appStyle/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Constants _constant = Constants();
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppStyles.primaryColor.withOpacity(.15),
                    ),
                    child: Icon(
                      Icons.close,
                      color: AppStyles.primaryColor,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('favorite');
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppStyles.primaryColor.withOpacity(.15),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.share,
                        color: AppStyles.primaryColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
              top: 100,
              right: 20,
              left: 20,
              child: Container(
                width: size.width * .8,
                height: size.height * .8,
                padding: EdgeInsets.all(20),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/code-scan.png',
                      height: 100,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Tap ToScan',
                      style: TextStyle(
                          color: AppStyles.primaryColor.withOpacity(.80),
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    )
                  ],
                )),
              ))
        ],
      ),
    );
  }
}
