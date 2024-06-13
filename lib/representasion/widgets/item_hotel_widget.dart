import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/color_config.dart';
import 'package:travel_app/core/constants/dismension_config.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/core/model/hotel_model.dart';
import 'package:travel_app/representasion/components/button_compoents.dart';
import 'package:travel_app/representasion/screens/detail_hotel_screen.dart';
import 'package:travel_app/representasion/widgets/dash_line.dart';

import '../../core/constants/textstyle.dart';

class ItemHotelWidget extends StatelessWidget {
  const ItemHotelWidget({Key? key, required this.hotelModel}) : super(key: key);
  final HotelModel hotelModel;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kDefaultPadding),
          color: Colors.white),
      margin: EdgeInsets.only(bottom: kMediumPadding),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(right: kDefaultPadding),
            child: ImageHelper.loadFormAsset(hotelModel.image,
                radius: BorderRadius.only(
                  topLeft: Radius.circular(kDefaultPadding),
                  bottomRight: Radius.circular(kDefaultPadding),
                )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: kDefaultPadding,
                ),
                Text(
                  hotelModel.name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  children: [
                    ImageHelper.loadFormAsset(AssetHelper.location),
                    SizedBox(
                      width: kMediumPadding,
                    ),
                    Text(
                      hotelModel.location,
                      style: TextStyle(),
                    ),
                    Text(
                      ' - ${hotelModel.awayKilomiter} from destinations',
                      style: TextStyle(color: ColorPalete.subTitleColor),
                    )
                  ],
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  children: [
                    ImageHelper.loadFormAsset(AssetHelper.start1),
                    SizedBox(
                      width: kMediumPadding,
                    ),
                    Text(
                      hotelModel.star.toString(),
                      style: TextStyle(),
                    ),
                    Text(
                      ' - ${hotelModel.numberOfReview} review',
                      style: TextStyle(color: ColorPalete.subTitleColor),
                    )
                  ],
                ),
                DashLineWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('\$${hotelModel.price}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                        SizedBox(height: kMediumPadding/2,),
                        Text('/night'),




                      ],
                    ),
                    ElevatedButton(
                          onPressed: (){
                            Navigator.of(context).pushNamed(DetailHotelScreen.routeName,arguments: hotelModel);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: ColorPalete.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            minimumSize: Size(size.width/3, 50),
                          ),
                          child: Text(
                            'Book a room',
                            style: TextStyles.textApp.bold.whiteTextColor,
                          ),
                        ),

                  ],
                ),
                SizedBox(height: kDefaultPadding,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
