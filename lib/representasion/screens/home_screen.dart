import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:travel_app/core/constants/dismension_config.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/representasion/screens/hotel_screen.dart';
import 'package:travel_app/representasion/screens/hotels_booking.dart';
import 'package:travel_app/representasion/widgets/app_bar_container.dart';

import '../../core/model/list_image.dart';
import '../widgets/item_destination2.dart';
import '../widgets/item_destinations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _buildItemCategory(
      Widget icon, Color color, Function() onTab, String title) {
    return GestureDetector(
      onTap: onTab,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: kMediumPadding),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kItemPadding),
              color: color.withOpacity(0.2),
            ),
            child: icon,
          ),
          SizedBox(
            height: kItemPadding,
          ),
          Text(title)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi Ngoc',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Text(
                  'Where are you going next? ',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Spacer(),
            Icon(
              FontAwesomeIcons.bell,
              size: kMediumPadding,
              color: Colors.white,
            ),
            SizedBox(
              width: kMediumPadding,
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kItemPadding),
                  color: Colors.white),
              padding: EdgeInsets.all(5),
              child: ClipRRect(borderRadius: BorderRadius.circular(10), child: ImageHelper.loadFormAsset(AssetHelper.anhtn)),
            )
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
                hintText: 'Search your destination',
                prefixIcon: Padding(
                  padding: EdgeInsets.all(20),
                  child: Icon(
                    FontAwesomeIcons.search,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(kItemPadding)),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: kItemPadding)),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Row(
            children: [
              Expanded(
                  child: _buildItemCategory(
                      ImageHelper.loadFormAsset(AssetHelper.hotel,
                          width: kMediumPadding, height: kMediumPadding),
                      Color(0xffFE9C5E), () {
                Navigator.of(context).pushNamed(HotelBooking.routeName);
              }, 'Hotels')),
              SizedBox(
                width: kDefaultPadding,
              ),
              Expanded(
                  child: _buildItemCategory(
                      ImageHelper.loadFormAsset(AssetHelper.flight,
                          width: kMediumPadding, height: kMediumPadding),
                      Color(0xfff77777),
                      () {},
                      'Flight')),
              SizedBox(
                width: kDefaultPadding,
              ),
              Expanded(
                  child: _buildItemCategory(
                      ImageHelper.loadFormAsset(AssetHelper.all,
                          width: kMediumPadding, height: kMediumPadding),
                      Color(0xff3ecbbc),
                      () {},
                      'All'))
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: kMinPadding, vertical: kMediumPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Destinations',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text('See All')
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 370,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: destinations.map((destination) {
                      return ItemDestinations(
                        image: destination.image,
                        title: destination.name,
                        numberStar: destination
                            .id, // Assuming `numberStar` is a string and `id` can be used here.
                      );
                    }).toList(),
                  ),
                ),
              ),
              Container(
                height: 370,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: destinations.map((destination) {
                      return ItemDestinations2(
                        image: destination.image,
                        title: destination.name,
                        numberStar: destination
                            .id, // Assuming `numberStar` is a string and `id` can be used here.
                      );
                    }).toList(),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
