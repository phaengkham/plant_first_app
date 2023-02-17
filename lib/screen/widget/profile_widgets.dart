import 'package:first_plat_app/appStyle/app_styles.dart';
import 'package:flutter/material.dart';

class profileWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const profileWidget({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: AppStyles.pBlack.withOpacity(.5),
                size: 24.0,
              ),
              SizedBox(
                width: 16.0,
              ),
              Text(
                title,
                style: TextStyle(
                    fontFamily: 'boonhome',
                    color: AppStyles.pBlack,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: AppStyles.pBlack.withOpacity(.4),
            size: 16.0,
          )
        ],
      ),
    );
  }
}
