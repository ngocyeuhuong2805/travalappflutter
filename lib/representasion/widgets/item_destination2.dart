import 'package:flutter/material.dart';
import '../../core/constants/dismension_config.dart';
import '../../core/helpers/asset_helper.dart';
import '../../core/helpers/image_helper.dart';

class ItemDestinations2 extends StatefulWidget {
  final String title, image, numberStar;

  const ItemDestinations2({
    Key? key,
    required this.title,
    required this.image,
    required this.numberStar,
  }) : super(key: key);

  @override
  State<ItemDestinations2> createState() => _ItemDestinationsState();
}

class _ItemDestinationsState extends State<ItemDestinations2> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kMediumPadding/2),
      child: Stack(
        children: [
          Container(
            width: 170,
            height: 150,
            decoration: BoxDecoration(
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                widget.image ?? AssetHelper.anhtn,
                fit: BoxFit.cover, // Set the fit to cover the container
                width: double.infinity,
                height: 125, // Adjust the height to show half of the image
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: kMediumPadding * 6, top: kMediumPadding/2),
            child: ImageHelper.loadFormAsset(AssetHelper.heart1),
          ),
          Positioned(
            left: kMediumPadding / 2,
            top: kMediumPadding * 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: kMediumPadding/2),
                  child: Text(
                    widget.title ?? 'Viet Nam',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: kTopPadding),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: kMinPadding),
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
                        Text(
                          widget.numberStar ?? '4.5',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                      ],
                    ),
                  ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}