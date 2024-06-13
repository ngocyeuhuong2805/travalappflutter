import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/color_config.dart';
import 'package:travel_app/core/constants/dismension_config.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/core/model/hotel_model.dart';
import 'package:travel_app/representasion/components/button_compoents.dart';
import 'package:travel_app/representasion/widgets/app_bar_container.dart';
import 'package:travel_app/representasion/widgets/item_room_widget.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key, required this.roomModel}) : super(key: key);
  final RoomModel roomModel;

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  List<String> listStep = ['Book a review', 'Payment', 'Confirm'];
  Widget _buildItemStepCheckOut(
      int step, String stepName, bool isEnd, bool isCheck) {
    return Row(
      children: [
        Container(
          width: kMediumPadding,
          height: kMediumPadding,
          decoration: BoxDecoration(
              color: isCheck ? Colors.white : Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(kMediumPadding)),
          alignment: Alignment.center,
          child: Text(
            step.toString(),
            style: TextStyle(color: isCheck ? Colors.black : Colors.white),
          ),
        ),
        SizedBox(
          width: kMinPadding,
        ),
        Text(
          stepName,
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
        SizedBox(
          width: kMinPadding,
        ),
        if (!isEnd)
          SizedBox(
            width: kDefaultPadding,
            child: Divider(
              height: 1,
              thickness: 1,
              color: Colors.white,
            ),
          ),
        if (!isEnd)
          SizedBox(
            width: kMinPadding,
          )
      ],
    );
  }

  Widget _buildItemOptionCheckout(String icon, String title, String value) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(kDefaultPadding)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ImageHelper.loadFormAsset(icon),
              SizedBox(
                width: kItemPadding,
              ),
              Text(title, style: TextStyle(fontWeight: FontWeight.bold),)
            ],
          ),
          SizedBox(
            height: kMediumPadding,
          ),
          Container(
            width: size.width/2,
            decoration: BoxDecoration(
                color: ColorPalete.primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(40)),
            padding: EdgeInsets.all(kMinPadding),
            child: Row(
              children: [
                Container(
                  width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40)),
                  child: Icon(Icons.add),
                ),
                SizedBox(width: kDefaultPadding,),
                Text(value, style: TextStyle(color: ColorPalete.primaryColor),)

              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return AppBarContainer(
        titleString: 'Check Out',
        iconArrowBack: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: listStep
                    .map((e) => _buildItemStepCheckOut(
                        listStep.indexOf(e) + 1,
                        e,
                        listStep.indexOf(e) == listStep.length - 1,
                        listStep.indexOf(e) == 0))
                    .toList(),
              ),
              SizedBox(
                height: kMinPadding*2,
              ),
              ItemRoomlWidget(
                roomModel: widget.roomModel,
                numberOfRoom: 1,
              ),
              _buildItemOptionCheckout(AssetHelper.contact, 'Contact Detail', 'Add Contact'),
              SizedBox(height: kDefaultPadding,),
              _buildItemOptionCheckout(AssetHelper.discount, 'Promo Code', 'Add Promo Code'),
              ButtonComponent(size: size, content: "Payment", onTap: (){},)
            ],
          ),
        ));
  }
}
