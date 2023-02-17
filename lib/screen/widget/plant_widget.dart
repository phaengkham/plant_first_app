import 'package:first_plat_app/appStyle/app_styles.dart';
import 'package:first_plat_app/models/plants.dart';
import 'package:first_plat_app/screen/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class widgetPlant extends StatelessWidget {
  const widgetPlant({
    Key? key,
    required this.index,
    required this.plantList,
  }) : super(key: key);

  final int index;
  final List<Plant> plantList;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
              child: DetailPage(
                plantId: plantList[index].plantId,
              ),
              type: PageTransitionType.bottomToTop),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppStyles.primaryColor.withOpacity(.1),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 80.0,
        padding: EdgeInsets.only(left: 10, top: 10),
        margin: EdgeInsets.only(bottom: 10, top: 10),
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                      color: AppStyles.primaryColor.withOpacity(.8),
                      shape: BoxShape.circle),
                ),
                Positioned(
                  bottom: 5,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 80.0,
                    child: Image.asset(plantList[index].imageURL),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  left: 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(plantList[index].category),
                      Text(
                        plantList[index].plantName,
                        style: AppStyles().titleH6,
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                r'$' + plantList[index].price.toString(),
                style: AppStyles().titleH5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
