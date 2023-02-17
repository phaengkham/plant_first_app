import 'package:first_plat_app/appStyle/app_styles.dart';
import 'package:first_plat_app/models/plants.dart';
import 'package:first_plat_app/screen/widget/plant_widget.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final List<Plant> addToCartPlant;
  const CartPage({super.key, required this.addToCartPlant});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: widget.addToCartPlant.isEmpty
            ? Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      child: Image.asset('assets/images/add-cart.png'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "your cart is empty",
                      style: AppStyles().titleH6,
                    )
                  ],
                ),
              )
            : Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 30),
                height: size.height,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: widget.addToCartPlant.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            return widgetPlant(
                                index: index, plantList: widget.addToCartPlant);
                          }),
                    ),
                    Column(
                      children: [
                        Divider(
                          thickness: 1.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Totals',
                              style: AppStyles().titleH4,
                            ),
                            Text(
                              r'$65',
                              style: AppStyles().titleH4,
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ));
  }
}
