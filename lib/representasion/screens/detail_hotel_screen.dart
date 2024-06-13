import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/core/constants/color_config.dart';
import 'package:travel_app/core/constants/dismension_config.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/core/model/hotel_model.dart';
import 'package:travel_app/representasion/components/button_compoents.dart';
import 'package:travel_app/representasion/screens/booking_room.dart';
import 'package:travel_app/representasion/widgets/arrow_back.dart';

import '../widgets/dash_line.dart';

class DetailHotelScreen extends StatefulWidget {
  const DetailHotelScreen({Key? key, required this.hotelModel}) : super(key: key);
  static const String routeName = 'detail_hotel_screen';
  final HotelModel hotelModel;

  @override
  State<DetailHotelScreen> createState() => _DetailHotelScreenState();
}

class _DetailHotelScreenState extends State<DetailHotelScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ImageHelper.loadFormAsset(AssetHelper.hoteldt,
                fit: BoxFit.fill),
          ),
          Positioned(
            top: kMediumPadding * 3,
              left: kMediumPadding,
              child: GestureDetector(
                onTap: (){Navigator.pop(context);},
                child: Container(
                  padding: EdgeInsets.all(kItemPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(kDefaultPadding)),
                    color: Colors.white
                  ),
                  child: Icon(FontAwesomeIcons.arrowLeft, size: 18,),
                ),
              )),
          Positioned(
              top: kMediumPadding * 3,
              right: kMediumPadding,
              child: GestureDetector(
                onTap: (){},
                child: Container(
                  padding: EdgeInsets.all(kItemPadding),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(kDefaultPadding)),
                      color: Colors.white
                  ),
                  child: Icon(FontAwesomeIcons.solidHeart, size: 18, color: Colors.red,),
                ),
              )),

          DraggableScrollableSheet(
              initialChildSize: 0.3,
              maxChildSize: 0.8,
              minChildSize: 0.3,
              builder: (context, scrollController) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(kDefaultPadding * 2),
                          topRight: Radius.circular(kDefaultPadding * 2))),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: kDefaultPadding),
                        child: Container(
                          height: 5,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(kDefaultPadding))),
                        ),
                      ),
                      SizedBox(
                        height: kMediumPadding,
                      ),
                      Expanded(
                          child: ListView(
                        controller: scrollController,
                        children: [
                          Row(
                            children: [
                              Text(widget.hotelModel.name, style: TextStyle(fontWeight: FontWeight.bold),),
                              Spacer(),
                              Text('\$${widget.hotelModel.price}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                              Text('/night'),
                            ],
                          ),
                          SizedBox(height: kDefaultPadding,),
                          Row(
                            children: [
                              ImageHelper.loadFormAsset(AssetHelper.location),
                              SizedBox(width: kMinPadding,),
                              Text(widget.hotelModel.location),
                              Text(('- ${widget.hotelModel.location} from destinations'))
                            ],
                          ),
                          DashLineWidget(),
                          Row(
                            children: [
                              ImageHelper.loadFormAsset(AssetHelper.start1),
                              SizedBox(width: kMinPadding,),
                              Text('${widget.hotelModel.star.toString()}/5'),
                              SizedBox(width: kMinPadding,),
                              Text('(${widget.hotelModel.numberOfReview} reviews)', style: TextStyle(color: ColorPalete.subTitleColor),),
                              Spacer(),
                              Text('See All', style: TextStyle(color: ColorPalete.primaryColor, fontWeight: FontWeight.bold),),



                            ],
                          ),
                          DashLineWidget(),
                          Text('Infomations', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                          SizedBox(height: kDefaultPadding,),
                          Text('You will find every comfort because many of the services that the\nhotel offers for travellers and of\ncourse the hotel is very comfortable.', style: TextStyle(fontSize: 15),),
                          SizedBox(height: kDefaultPadding,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              ItemWidgetServices(image: AssetHelper.fork, color: Color(0xff6155CC), title: 'Food',),
                              ItemWidgetServices(image: AssetHelper.wifi, color: Color(0xffFE9C5E), title: 'Wifi',),
                              ItemWidgetServices(image: AssetHelper.exchange, color: Color(0xffF97674), title: 'Exchange',),
                              ItemWidgetServices(image: AssetHelper.reception, color: Color(0xff34C9BD), title: 'Front Desk',),
                              ItemWidgetServices(image: AssetHelper.heart1, color: Colors.red, title: 'More',),
                            ],
                          ),
                          SizedBox(height: kDefaultPadding,),
                          Text('Location', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                          SizedBox(height: kDefaultPadding,),
                          Text('Located in the famous neighborhood of Seoul,\nGrand Luxury’s is set in a building built in the\n2010s.', style: TextStyle(fontSize: 15),),
                          SizedBox(height: kDefaultPadding,),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                              child: ImageHelper.loadFormAsset(AssetHelper.map)),
                          SizedBox(height: kDefaultPadding,),
                          ButtonComponent(size: size, content: 'Select Room', onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => BookingRoom(hotelModel: widget.hotelModel)));
                          }),

                          SizedBox(height: kDefaultPadding,),

                        ],
                      ))
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}

class ItemWidgetServices extends StatelessWidget {
  const ItemWidgetServices({
    super.key,
    required this.image,
    required this.color,
    required this.title,

  });
  final String image;
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(kItemPadding),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(kDefaultPadding)),
              color: color.withOpacity(0.25)
          ),
          child: ImageHelper.loadFormAsset(image, width: 20, height: 20, fit: BoxFit.cover),
        ),
        SizedBox(height: kDefaultPadding,),
        Text(title, style: TextStyle(fontSize: 12),)
      ],
    );
  }
}
