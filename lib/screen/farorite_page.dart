import 'package:first_plat_app/appStyle/app_styles.dart';
import 'package:first_plat_app/models/plants.dart';
import 'package:first_plat_app/screen/widget/plant_widget.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  final List<Plant> favoritePlants;
  const FavoritePage({super.key, required this.favoritePlants});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: widget.favoritePlants.isEmpty
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: Image.asset('assets/images/favorited.png'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "your favorite plant",
                    style: AppStyles().titleH5,
                  )
                ],
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 30),
              height: size.height * .5,
              child: ListView.builder(
                  itemCount: widget.favoritePlants.length,
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return widgetPlant(
                        index: index, plantList: widget.favoritePlants);
                  }),
            ),
    );
  }
}
