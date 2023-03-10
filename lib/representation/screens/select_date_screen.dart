import 'package:flutter/material.dart';
import 'package:flutter_travel_app/core/Controllers/get_x_controller.dart';
import 'package:flutter_travel_app/core/constants/color_constants.dart';
import 'package:flutter_travel_app/core/constants/dimension_constants.dart';
import 'package:flutter_travel_app/representation/widgets/app_bar_container.dart';
import 'package:flutter_travel_app/representation/widgets/button_widget.dart';
import 'package:get/get.dart';
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
  GetXController getX = Get.find<GetXController>();

  @override
  void initState() {
    super.initState();
    setState(() {
      rangeStartDate = getX.datetimeRangeSelected[0];
      rangeEndDate = getX.datetimeRangeSelected[1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      implementLeading: true,
      titleString: 'Select date',
      child: Column(
        children: [
          SizedBox(
            height: containerPaddingWithAppBar + 29,
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
            onTap: () {
              Navigator.of(context).pop([rangeStartDate, rangeEndDate]);
              if (rangeStartDate == null) return;
              getX.updateDatetimeRangeSelected(
                  [rangeStartDate as DateTime, rangeEndDate as DateTime]);
            },
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          ButtonWidget(
            title: 'Cancel',
            onTap: () => Navigator.of(context).pop([null, null]),
          )
        ],
      ),
    );
  }
}
