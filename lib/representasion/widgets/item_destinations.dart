import 'package:flutter/material.dart';
import 'package:travel_app/representasion/screens/detail_destinations.dart';

import '../../core/constants/dismension_config.dart';
import '../../core/helpers/asset_helper.dart';
import '../../core/helpers/image_helper.dart';

class ItemDestinations extends StatefulWidget {
  final String title, image, numberStar;
  const ItemDestinations({
    super.key, required this.title, required this.image, required this.numberStar,
  });

  @override
  State<ItemDestinations> createState() => _ItemDestinationsState();
}

class _ItemDestinationsState extends State<ItemDestinations> {
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(DetailDestinations.routeName);
      },
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: kTopPadding),
            width: 170,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(widget.image ?? AssetHelper.anhtn, fit: BoxFit.cover,),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: kMediumPadding*6, top: kMediumPadding,),
            child: ImageHelper.loadFormAsset(AssetHelper.heart1),
          ),
          Container(
            padding: EdgeInsets.only(left: kMediumPadding/2, top: kMediumPadding*7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title ?? 'Viet Nam', style: TextStyle(color: Colors.white),),
                SizedBox(height: kTopPadding,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: kMinPadding, ),
                  alignment: Alignment.center,
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kMinPadding),
                    color: Colors.white.withOpacity(0.4),
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ImageHelper.loadFormAsset(AssetHelper.start1),
                      Text(widget.numberStar ?? '4.5', style: TextStyle(color: Colors.black, fontSize: 12),),
                    ],



                  ),
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}