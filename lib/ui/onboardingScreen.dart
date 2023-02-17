import 'package:first_plat_app/appStyle/app_styles.dart';
import 'package:first_plat_app/appStyle/constants.dart';
import 'package:first_plat_app/ui/sigin_page.dart';
import 'package:first_plat_app/ui/root_page.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.pWihte,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppStyles.pWihte,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20, top: 20),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => SigIn()));
              },
              child: Text(
                "Skip",
                style: TextStyle(
                    color: AppStyles.pGreg,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400),
              ),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              createPage(
                image: 'assets/images/plant-one.png',
                title: Constants.tittle,
                description: Constants.descriptionOne,
              ),
              createPage(
                image: 'assets/images/plant-two.png',
                title: Constants.tittle,
                description: Constants.descriptionOne,
              ),
              createPage(
                image: 'assets/images/plant-three.png',
                title: Constants.tittle,
                description: Constants.descriptionOne,
              ),
            ],
          ),
          Positioned(
            bottom: 80,
            left: 30,
            child: Row(
              children: _builIndicator(),
            ),
          ),
          Positioned(
            bottom: 60,
            right: 30,
            child: Container(
              child: IconButton(
                onPressed: () {
                  setState(() {
                    if (currentIndex < 2) {
                      currentIndex++;

                      if (currentIndex < 3) {
                        _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      }
                    } else {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) => const SigIn()));
                    }
                  });
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: AppStyles.pWihte,
                ),
              ),
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: AppStyles.primaryColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 10.0,
      width: isActive ? 20 : 8,
      margin: EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        color: AppStyles.primaryColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  List<Widget> _builIndicator() {
    List<Widget> indecator = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indecator.add(
          _indicator(true),
        );
      } else {
        indecator.add(
          _indicator(false),
        );
      }
    }
    return indecator;
  }
}

class createPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  const createPage(
      {Key? key,
      required this.image,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 350,
            child: Image.asset(image),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppStyles().titleH1,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: AppStyles().subtitleH6,
            selectionColor: AppStyles.pGreg,
          )
        ],
      ),
    );
  }
}
