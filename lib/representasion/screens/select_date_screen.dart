

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:travel_app/core/constants/color_config.dart';
import 'package:travel_app/core/constants/dismension_config.dart';
import 'package:travel_app/representasion/components/button_compoents.dart';
import 'package:travel_app/representasion/widgets/app_bar_container.dart';

class SelectDateScreen extends StatelessWidget {

  static final String routeName = 'select_date';
  DateTime? rangeStartDate;
  DateTime? rangeEndDate;


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return AppBarContainer(
      titleString: 'Select Date',
      iconArrowBack: true,
      child: Column(
        children: [
          SizedBox(
            height: kMediumPadding*2,
          ),
          SfDateRangePicker(
            view: DateRangePickerView.month,
            selectionMode: DateRangePickerSelectionMode.range,
            monthViewSettings: DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
            selectionColor: ColorPalete.yellowColor,
            startRangeSelectionColor: ColorPalete.yellowColor,
            endRangeSelectionColor: ColorPalete.yellowColor,
            rangeSelectionColor: ColorPalete.yellowColor.withOpacity(0.25),
            todayHighlightColor: ColorPalete.yellowColor,
            toggleDaySelection: true,
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args){
              if(args.value is PickerDateRange){
                rangeStartDate = args.value.startDate;
                rangeEndDate = args.value.endDate;
              }else{
                rangeStartDate = null;
                rangeEndDate = null;
              }

            }
          ),
          ButtonComponent(size: size, content: 'Select', onTap: (){Navigator.of(context).pop([rangeStartDate, rangeEndDate]);},),
          Padding(
            padding: const EdgeInsets.only(top: kMediumPadding),
            child: ButtonComponent(size: size, content: 'Cancle', onTap: (){Navigator.of(context).pop([rangeStartDate, rangeEndDate]);},),
          ),
        ],

      ),

    );
  }
}

