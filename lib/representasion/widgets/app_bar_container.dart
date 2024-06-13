import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/core/constants/color_config.dart';
import 'package:travel_app/core/constants/dismension_config.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';

class AppBarContainer extends StatefulWidget {
  AppBarContainer({
    Key? key,
    required this.child,
    this.title,
    this.titleString,
    this.titleString2,
    this.iconArrowBack = false,
    this.traling = false,
    this.showTitleString2 = false,
  }) : super(key: key);

  final Widget child;
  final Widget? title;
  final String? titleString;
  final String? titleString2;
  final bool? iconArrowBack;
  final bool? traling;
  final bool showTitleString2;

  @override
  State<AppBarContainer> createState() => _AppBarContainerState();
}

class _AppBarContainerState extends State<AppBarContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 200,
            child: AppBar(
              centerTitle: true,
              title: widget.title ??
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (widget.iconArrowBack == true)
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(kDefaultPadding)),
                                color: Colors.white),
                            padding: const EdgeInsets.all(kItemPadding),
                            child: const Icon(
                              FontAwesomeIcons.arrowLeft,
                              color: Colors.black,
                              size: kDefaultIconSize,
                            ),
                          ),
                        ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(top: kMediumPadding),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                               Padding(
                                 padding: const EdgeInsets.only(bottom: 20),
                                 child: Text(
                                    widget.titleString ?? '',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 30),
                                  ),
                               ),

                              if (widget.showTitleString2)
                                Text(
                                  widget.titleString2 ?? '',
                                  style: const TextStyle(
                                      fontSize: 15),
                                ),
                            ],
                          ),
                        ),
                      ),
                      if (widget.traling == true)
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(kDefaultPadding)),
                              color: Colors.white),
                          padding: EdgeInsets.all(kItemPadding),
                          child: Icon(
                            FontAwesomeIcons.bars,
                            color: Colors.black,
                            size: kDefaultPadding,
                          ),
                        ),
                    ],
                  ),
              automaticallyImplyLeading: false,
              elevation: 0,
              toolbarHeight: 90,
              backgroundColor: ColorPalete.bgScaffoldColor,
              flexibleSpace: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: Gradients.defaultGradientBground,
                      borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(35)),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: ImageHelper.loadFormAsset(
                        AssetHelper.oval1), // Corrected method name
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: ImageHelper.loadFormAsset(
                        AssetHelper.oval2), // Corrected method name
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 156),
            padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
            child: widget.child,
          ),
        ],
      ),
    );
  }
}