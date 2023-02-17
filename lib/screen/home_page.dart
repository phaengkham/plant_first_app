import 'package:first_plat_app/appStyle/app_styles.dart';
import 'package:first_plat_app/models/plants.dart';
import 'package:first_plat_app/screen/detail_page.dart';
import 'package:first_plat_app/screen/widget/plant_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    Size size = MediaQuery.of(context).size;

    List<Plant> _plantList = Plant.plantList;

    List<String> _plantTypes = [
      'Recommeded',
      'Indoor',
      'Outdoor',
      'Garden',
      'Supplement'
    ];

    bool toggleIsFavorite(bool isFavorited) {
      return !isFavorited;
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    width: size.width * .9,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          color: AppStyles.pBlack.withOpacity(.6),
                        ),
                        Expanded(
                          child: TextField(
                            showCursor: false,
                            decoration: InputDecoration(
                              hintText: 'Search Plant',
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.mic,
                          color: AppStyles.pBlack.withOpacity(.6),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: AppStyles.primaryColor.withOpacity(.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: size.width,
              height: 50.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _plantTypes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Text(
                          _plantTypes[index],
                          style: TextStyle(
                            fontWeight: selectedIndex == index
                                ? FontWeight.bold
                                : FontWeight.w300,
                            color: selectedIndex == index
                                ? AppStyles.primaryColor
                                : AppStyles.pBlack,
                          ),
                        )),
                  );
                },
              ),
            ),
            SizedBox(
              height: size.height * .3,
              child: ListView.builder(
                  itemCount: _plantList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              child: DetailPage(
                                plantId: _plantList[index].plantId,
                              ),
                              type: PageTransitionType.bottomToTop),
                        );
                      },
                      child: Container(
                        width: 200,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 10,
                              right: 20,
                              child: Container(
                                height: 50,
                                width: 50,
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      bool isFavorited = toggleIsFavorite(
                                          _plantList[index].isFavorated);
                                      _plantList[index].isFavorated =
                                          isFavorited;
                                    });
                                  },
                                  icon: Icon(
                                    _plantList[index].isFavorated == true
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: AppStyles.primaryColor,
                                  ),
                                  //color: AppStyles.primaryColor,
                                  iconSize: 30,
                                ),
                                decoration: BoxDecoration(
                                    color: AppStyles.pWihte,
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                            ),
                            Positioned(
                              left: 50,
                              right: 50,
                              bottom: 50,
                              top: 50,
                              child: Image.asset(_plantList[index].imageURL),
                            ),
                            Positioned(
                              bottom: 15,
                              left: 20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _plantList[index].category,
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 16),
                                  ),
                                  Text(
                                    _plantList[index].plantName,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white70,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                                bottom: 15,
                                right: 20,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: AppStyles.pWihte,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    r'$' + _plantList[index].price.toString(),
                                    style: AppStyles().titleH5,
                                  ),
                                ))
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: AppStyles.primaryColor.withOpacity(.8),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    );
                  }),
            ),

            //text after slide
            Container(
              padding: EdgeInsets.only(left: 16, bottom: 20, top: 20),
              child: Text(
                "New Plants",
                style: AppStyles().titleH5,
              ),
            ),
            //plant slide
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              height: size.height * .5,
              child: ListView.builder(
                  itemCount: _plantList.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return widgetPlant(
                      index: index,
                      plantList: _plantList,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
