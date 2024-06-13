import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/color_config.dart';
import 'package:travel_app/core/constants/dismension_config.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/core/model/hotel_model.dart';
import 'package:travel_app/representasion/screens/check_out_screen.dart';
import 'package:travel_app/representasion/screens/detail_hotel_screen.dart';
import 'package:travel_app/representasion/widgets/dash_line.dart';

import '../../core/constants/textstyle.dart';

class ItemRoomlWidget extends StatelessWidget {
  const ItemRoomlWidget({Key? key, required this.roomModel, this.numberOfRoom}) : super(key: key);
  final RoomModel roomModel;
  final int? numberOfRoom;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kDefaultPadding),
          color: Colors.white),
      margin: EdgeInsets.only(bottom: kMediumPadding),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(roomModel.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    Text(roomModel.size,),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    Text(roomModel.cancellation),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ImageHelper.loadFormAsset(roomModel.image, width: 80, height: 60, fit: BoxFit.cover),
                )

              ],

            ),
            SizedBox(height: kDefaultPadding,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ItemWidgetServices(image: AssetHelper.fork, color: Color(0xff6155CC), title: 'Food',),
                ItemWidgetServices(image: AssetHelper.wifi, color: Color(0xffFE9C5E), title: 'Wifi',),
                ItemWidgetServices(image: AssetHelper.exchange, color: Color(0xffF97674), title: 'Exchange',),
                ItemWidgetServices(image: AssetHelper.reception, color: Color(0xff34C9BD), title: 'Front Desk',),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  DashLineWidget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('\$${roomModel.price}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                          SizedBox(height: kMediumPadding/2,),
                          Text('/night'),

                        ],
                      ),
                      numberOfRoom == null ?
                      ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CheckOutScreen(roomModel: roomModel)));

                        },
                        style: ElevatedButton.styleFrom(
                          primary: ColorPalete.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          minimumSize: Size(size.width/3, 50),
                        ),
                        child: Text(
                          'Choose',
                          style: TextStyles.textApp.bold.whiteTextColor,
                        ),
                      ) : Text('$numberOfRoom  room'),

                    ],
                  ),
                  SizedBox(height: kDefaultPadding,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
