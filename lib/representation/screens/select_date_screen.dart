import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/constants/color_constants.dart';
import 'package:flutter_travel_app/core/constants/dimension_constants.dart';
import 'package:flutter_travel_app/representation/widgets/app_bar_container.dart';
import 'package:flutter_travel_app/representation/widgets/button_widget.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SelectDateScreen extends StatefulWidget {
  const SelectDateScreen({super.key});

  static String routerName = '/select_date_screen';

  @override
  State<SelectDateScreen> createState() => _SelectDateScreenState();
}

class _SelectDateScreenState extends State<SelectDateScreen> {
  DateTime? rangeStartDate;
  DateTime? rangeEndDate;

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      implementLeading: true,
      titleString: 'Select date',
      child: Column(
        children: [
          SizedBox(
            height: kMediumPadding * 1.5,
          ),
          SfDateRangePicker(
            view: DateRangePickerView.month,
            selectionMode: DateRangePickerSelectionMode.range,
            monthViewSettings:
                DateRangePickerMonthViewSettings(firstDayOfWeek: 1),
            selectionColor: ColorPalette.yellowColor,
            startRangeSelectionColor: ColorPalette.yellowColor,
            endRangeSelectionColor: ColorPalette.yellowColor,
            rangeSelectionColor: ColorPalette.yellowColor.withOpacity(0.2),
            todayHighlightColor: ColorPalette.yellowColor,
            toggleDaySelection: true,
            initialSelectedRange: PickerDateRange(rangeStartDate, rangeEndDate),
            onSelectionChanged: ((DateRangePickerSelectionChangedArgs args) {
              if (args.value is PickerDateRange) {
                setState(() {
                  rangeStartDate = args.value.startDate;
                  rangeEndDate = args.value.endDate;
                });
              }
            }),
          ),
          ButtonWidget(
            title: 'Select',
            onTap: () =>
                Navigator.of(context).pop([rangeStartDate, rangeEndDate]),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          ButtonWidget(
            title: 'Cancel',
            onTap: () {
              setState(() {
                rangeStartDate = null;
                rangeEndDate = null;
              });
            },
          )
        ],
      ),
    );
  }
}
