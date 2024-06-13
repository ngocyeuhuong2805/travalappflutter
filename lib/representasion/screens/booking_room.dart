import 'package:flutter/material.dart';
import 'package:travel_app/representasion/widgets/item_room_widget.dart';

import '../../core/model/hotel_model.dart';
import '../widgets/app_bar_container.dart';

class BookingRoom extends StatefulWidget {
  final HotelModel hotelModel;

  const BookingRoom({Key? key, required this.hotelModel}) : super(key: key);

  static const String routeName = 'booking_room';

  @override
  State<BookingRoom> createState() => _BookingRoomState();
}

class _BookingRoomState extends State<BookingRoom> {
  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      iconArrowBack: true,
      titleString: 'Select Room',
      child: SingleChildScrollView(
        child: Column(
          children: widget.hotelModel.listRoomModel.map((room) => ItemRoomlWidget(roomModel: room)).toList(),
        ),
      ),
    );
  }
}