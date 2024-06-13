import 'package:flutter/material.dart';
import 'package:travel_app/core/model/hotel_model.dart';
import 'package:travel_app/representasion/widgets/app_bar_container.dart';
import 'package:travel_app/representasion/widgets/item_hotel_widget.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({Key? key}) : super(key: key);
  static final String routeName = 'hotel_screen';

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {

  @override
  Widget build(BuildContext context) {


    return AppBarContainer(
      titleString: 'Hotels',
        iconArrowBack: true,
        traling: true,
        child: SingleChildScrollView(
          child: Column(
            children: listHotel.map((e) => ItemHotelWidget(hotelModel: e)).toList(),
          ),
        ));
  }
}
