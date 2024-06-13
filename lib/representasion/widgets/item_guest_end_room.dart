import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dismension_config.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';

class ItemGuestAndRoom extends StatefulWidget {
  const ItemGuestAndRoom({
    Key? key,
    required this.title,
    required this.icon,
    required this.initData,
    this.iconMo,
    required this.onNumberChanged, // Add this line
  }) : super(key: key);

  final String title;
  final String icon;
  final int initData;
  final String? iconMo;
  final ValueChanged<int> onNumberChanged; // Add this line

  @override
  State<ItemGuestAndRoom> createState() => _ItemGuestAndRoomState();
}

class _ItemGuestAndRoomState extends State<ItemGuestAndRoom> {
  late final TextEditingController textEditingController;
  final FocusNode focusNode = FocusNode();
  late int number;

  @override
  void initState() {
    number = widget.initData;
    super.initState();
    textEditingController = TextEditingController(text: widget.initData.toString())
      ..addListener(() {
        setState(() {
          number = int.parse(textEditingController.text);
          widget.onNumberChanged(number); // Call the callback
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kTopPadding),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(bottom: kMediumPadding),
      padding: EdgeInsets.all(kMediumPadding),
      child: Row(
        children: [
          ImageHelper.loadFormAsset(widget.icon),
          SizedBox(width: kDefaultPadding),
          Text(widget.title),
          Spacer(),
          GestureDetector(
            onTap: () {
              if (number > 1) {
                setState(() {
                  number--;
                  textEditingController.text = number.toString();
                  widget.onNumberChanged(number); // Call the callback

                  if (focusNode.hasFocus) {
                    focusNode.unfocus();
                  }
                });
              }
            },
            child: ImageHelper.loadFormAsset(
              number > 1 ? AssetHelper.giam : widget.iconMo ?? AssetHelper.giam,
            ),
          ),
          Container(
            height: 35,
            width: 60,
            padding: EdgeInsets.only(left: 3),
            alignment: Alignment.center,
            child: TextField(
              controller: textEditingController,
              textAlign: TextAlign.center,
              focusNode: focusNode,
              enabled: true,
              autocorrect: false,
              minLines: 1,
              maxLines: 1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.only(bottom: 18),
              ),
              onChanged: (value) {},
              onSubmitted: (String submitValue) {},
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                number++;
                textEditingController.text = number.toString();
                widget.onNumberChanged(number); // Call the callback
                if (focusNode.hasFocus) {
                  focusNode.unfocus();
                }
              });
            },
            child: ImageHelper.loadFormAsset(AssetHelper.tang),
          ),
        ],
      ),
    );
  }
}