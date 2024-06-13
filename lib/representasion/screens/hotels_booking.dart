import 'package:flutter/material.dart';
import 'package:travel_app/core/extensions/date_ext.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/representasion/components/button_compoents.dart';
import 'package:travel_app/representasion/screens/guest_and_room.dart';
import 'package:travel_app/representasion/screens/hotel_screen.dart';
import 'package:travel_app/representasion/screens/select_date_screen.dart';
import 'package:travel_app/representasion/widgets/app_bar_container.dart';
import 'package:travel_app/representasion/widgets/item_booking_widget.dart';
import '../../core/constants/dismension_config.dart';

class HotelBooking extends StatefulWidget {
  const HotelBooking({Key? key}) : super(key: key);
  static final String routeName = 'hotel_booking';

  @override
  State<HotelBooking> createState() => _HotelBookingState();
}

class _HotelBookingState extends State<HotelBooking> {
  String? dateSelected;
  int numberOfGuests = 2;
  int numberOfRooms = 1;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return AppBarContainer(
      traling: true,
      titleString2: 'Choose your favorite hotel and enjoy the service',
      showTitleString2: true,
      titleString: 'Hotel Booking',
      iconArrowBack: true,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: kMediumPadding * 2,
            ),
            ItemBookingWidget(
              icon: AssetHelper.location,
              title: 'Destination',
              des: 'South Korea',
              color: Color(0xffFE9C5E).withOpacity(0.2),
            ),
            StatefulBuilder(
              builder: (context, setState) {
                return ItemBookingWidget(
                  icon: AssetHelper.date,
                  title: 'Select Date',
                  des: dateSelected ?? '13 Feb - 18 Feb 2021',
                  color: Color(0xffF77777).withOpacity(0.2),
                  onTab: () async {
                    final result = await Navigator.of(context).pushNamed(SelectDateScreen.routeName);
                    if (!(result as List<DateTime?>).any((element) => element == null)) {
                      setState(() {
                        dateSelected = '${result[0]?.getStartDate} - ${result[1]?.getEndDate}';
                      });
                    }
                  },
                );
              },
            ),
            ItemBookingWidget(
              icon: AssetHelper.room,
              title: 'Guest and Room',
              des: '$numberOfGuests Guest, $numberOfRooms Room',
              color: Color(0xff3EC8BC).withOpacity(0.2),
              onTab: () async {
                final result = await Navigator.of(context).pushNamed(
                  GuestAndRoomScreen.routeName,
                  arguments: {
                    'guests': numberOfGuests,
                    'rooms': numberOfRooms,
                  },
                );
                if (result != null && result is Map<String, int>) {
                  setState(() {
                    numberOfGuests = result['guests'] ?? numberOfGuests;
                    numberOfRooms = result['rooms'] ?? numberOfRooms;
                  });
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kMediumPadding),
              child: ButtonComponent(
                size: size,
                content: 'Search',
                onTap: () {
                  Navigator.of(context).pushNamed(HotelScreen.routeName);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}