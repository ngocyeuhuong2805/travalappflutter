import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dismension_config.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/representasion/components/button_compoents.dart';
import 'package:travel_app/representasion/widgets/app_bar_container.dart';
import '../widgets/item_guest_end_room.dart';

class GuestAndRoomScreen extends StatefulWidget {
  const GuestAndRoomScreen({Key? key}) : super(key: key);
  static final String routeName = 'guest_and_room';

  @override
  State<GuestAndRoomScreen> createState() => _GuestAndRoomScreenState();
}

class _GuestAndRoomScreenState extends State<GuestAndRoomScreen> {
  late int numberOfGuests;
  late int numberOfRooms;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)?.settings.arguments as Map<String, int>?;
    numberOfGuests = arguments?['guests'] ?? 2;
    numberOfRooms = arguments?['rooms'] ?? 1;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return AppBarContainer(
      titleString: 'Add guest and room',
      iconArrowBack: true,
      child: Column(
        children: [
          SizedBox(
            height: kMediumPadding * 3,
          ),
          ItemGuestAndRoom(
            title: 'Guest',
            icon: AssetHelper.guest,
            initData: numberOfGuests,
            onNumberChanged: (value) {
              setState(() {
                numberOfGuests = value;
              });
            },
          ),
          ItemGuestAndRoom(
            title: 'Room',
            icon: AssetHelper.room1,
            initData: numberOfRooms,
            onNumberChanged: (value) {
              setState(() {
                numberOfRooms = value;
              });
            },
          ),
          SizedBox(
            height: kMediumPadding,
          ),
          ButtonComponent(
            size: size,
            content: 'Done',
            onTap: () {
              Navigator.of(context).pop({
                'guests': numberOfGuests,
                'rooms': numberOfRooms,
              });
            },
          ),
        ],
      ),
    );
  }
}