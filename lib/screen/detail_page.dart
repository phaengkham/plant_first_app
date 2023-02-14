import 'package:first_plat_app/appStyle/app_styles.dart';
import 'package:first_plat_app/models/plants.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final int plantId;
  const DetailPage({super.key, required this.plantId});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool toggleIsFavorited(bool isFavorited) {
    return !isFavorited;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Plant> _plantList = Plant.plantList;
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
                      onPressed: () {
                        setState(() {
                          bool isFavorited = toggleIsFavorited(
                              _plantList[widget.plantId].isFavorated);
                          _plantList[widget.plantId].isFavorated = isFavorited;
                        });
                      },
                      icon: Icon(
                        _plantList[widget.plantId].isFavorated == true
                            ? Icons.favorite
                            : Icons.favorite_border,
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
            left: 20,
            right: 20,
            child: Container(
              width: size.width * .8,
              height: size.height * .8,
              padding: EdgeInsets.all(20),
              child: Stack(
                children: [
                  Positioned(
                      top: 10,
                      left: 0,
                      child: SizedBox(
                          height: 350,
                          child: Image.asset(
                              _plantList[widget.plantId].imageURL))),
                  Positioned(
                    top: 10,
                    right: 0,
                    child: SizedBox(
                      height: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PlantFeature(
                            title: 'Size',
                            plantFeatur: _plantList[widget.plantId].size,
                          ),
                          PlantFeature(
                            title: 'Humidity',
                            plantFeatur:
                                _plantList[widget.plantId].humidity.toString(),
                          ),
                          PlantFeature(
                            title: 'Temperature',
                            plantFeatur: _plantList[widget.plantId].temperature,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(top: 80, left: 30, right: 30),
              height: size.height * .5,
              width: size.width,
              decoration: BoxDecoration(
                color: AppStyles.primaryColor.withOpacity(.4),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _plantList[widget.plantId].plantName,
                            style: AppStyles().titleH4,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            r'$' + _plantList[widget.plantId].price.toString(),
                            style: AppStyles().titleH4,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            _plantList[widget.plantId].rating.toString(),
                            style: AppStyles().titleH5,
                          ),
                          Icon(
                            Icons.star,
                            size: 30.0,
                            color: AppStyles.primaryColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Expanded(
                    child: Text(
                      _plantList[widget.plantId].decription,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 18, height: 1.5, color: AppStyles.pBlack),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: SizedBox(
        width: size.width * .9,
        height: 50,
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart,
                    color: _plantList[widget.plantId].isSelected == true
                        ? Colors.white
                        : AppStyles.primaryColor,
                  )),
              decoration: BoxDecoration(
                  color: _plantList[widget.plantId].isSelected == true
                      ? AppStyles.primaryColor.withOpacity(.5)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 1),
                        blurRadius: 5,
                        color: AppStyles.primaryColor.withOpacity(.3))
                  ]),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: AppStyles.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 1),
                      blurRadius: 5,
                      color: AppStyles.primaryColor.withOpacity(.3),
                    ),
                  ]),
              child: Center(
                child: Text(
                  'BUY Now',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class PlantFeature extends StatelessWidget {
  final String plantFeatur;
  final String title;
  const PlantFeature({
    Key? key,
    required this.plantFeatur,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles().subtitleH6,
        ),
        Text(
          plantFeatur,
          style: AppStyles().titleH5,
        )
      ],
    );
  }
}
