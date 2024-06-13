import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app/core/constants/dismension_config.dart';
import 'package:travel_app/representasion/components/button_compoents.dart';
import 'package:travel_app/representasion/screens/hotels_booking.dart';
import 'package:travel_app/representasion/widgets/arrow_back.dart';
import 'package:travel_app/representasion/widgets/start_widget.dart';



class DetailDestinations extends StatefulWidget {
  const DetailDestinations({Key? key}) : super(key: key);
  static final String routeName = 'detail_destination';


  @override
  State<DetailDestinations> createState() => _DetailDestinationsState();
}

class _DetailDestinationsState extends State<DetailDestinations> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List<String> image = [
      'https://media.baoquangninh.vn/dataimages/202012/original/images1460745_anh_1.jpg',
      'https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2020/03/ba-na-hill.jpeg',
      'https://ktmt.vnmediacdn.com/images/2021/08/03/7-1627963639-5f9bf78b329f7bdf8ceee0fd55fc2176.jpg',
      'https://cellphones.com.vn/sforum/wp-content/uploads/2023/10/canh-dep-49.jpg',
    ];
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ClipRRect(
              child: SizedBox(
                width: size.width,
                height: size.height,
                child: Image.network(
                    'https://ktmt.vnmediacdn.com/images/2021/08/03/7-1627961881-images10898921-1611196252800651567316.jpg',
                    fit: BoxFit.cover),
              ),
            ),
            ArrowBack(),
        Padding(
          padding: const EdgeInsets.only(top: kMediumPadding*4),
          child: CarouselSlider(
            options: CarouselOptions(
              height: 400,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              autoPlay: true,
            ),
            items: image.map((e) => Builder(
              builder: (BuildContext context) {
                return Container(
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    image: DecorationImage(
                      image: NetworkImage(e),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            )).toList(),
          ),
        ),
            Container(
              padding: EdgeInsets.only(top: size.height/1.6, left: kTopPadding*5),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Best Summer Vacation\nat Viet Nam', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),),
                  SizedBox(height: kMediumPadding,),
                  Text('Vinh Ha Long', style: TextStyle(fontSize: 15, color: Colors.white),),
                  SizedBox(height: kMediumPadding/2),
                  Row(
                    children: [
                      StartComponent(),
                      StartComponent(),
                      StartComponent(),
                      StartComponent(),
                      StartComponent(),
                      Text('(5.0)', style: TextStyle(fontSize: 12, color: Colors.white),)
                    ],
                  )

                ],

              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height/1.2, left: kTopPadding*4, right: kTopPadding*4),
              child: ButtonComponent(size: size, content: 'Booking', onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => HotelBooking()));
              },),
            )
          ],
        ),
      ),
    );
  }
}
