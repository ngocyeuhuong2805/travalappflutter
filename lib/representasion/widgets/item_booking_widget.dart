import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dismension_config.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';

class ItemBookingWidget extends StatelessWidget {
  const ItemBookingWidget({Key? key, required this.icon, required this.title, required this.des, this.onTab, required this.color}) : super(key: key);
  final String icon;
  final String title;
  final String des;
  final Color color;
  // final Color color;
  final Function()? onTab;


  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.only(top: kMediumPadding),
      child: GestureDetector(
        onTap: onTab,
        child: Container(
          padding: EdgeInsets.all(kDefaultPadding),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(kItemPadding))
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kItemPadding),
                  color: color
                ),
                child: Image.asset(icon, width: 30, height: 30,),
              ),
              SizedBox(
                width: kItemPadding,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title ,),
                  SizedBox(
                    height: kMinPadding,
                  ),
                  Text(des, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

