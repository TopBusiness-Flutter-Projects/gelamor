import 'package:flutter/material.dart';
import 'package:gelamor/core/utils/app_colors.dart';
import 'package:gelamor/core/widgets/custom_button.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

class CalenderScreen extends StatelessWidget {
  CalenderScreen({Key? key}) : super(key: key);
  final calendarController = CleanCalendarController(
    minDate: DateTime.now(),
    maxDate: DateTime.now().add(const Duration(days: 365)),
    onRangeSelected: (firstDate, secondDate) {
      print('----------------------------------------------');
      print('${firstDate.year}-${firstDate.month}-${firstDate.day}');
      secondDate!=null?print('${secondDate.year}-${secondDate.month}-${secondDate.day}'):null;
      print('----------------------------------------------');
      // print(secondDate);
    },
    onDayTapped: (date) {},
    // readOnly: true,
    onPreviousMinDateTapped: (date) {},
    onAfterMaxDateTapped: (date) {},
    weekdayStart: DateTime.sunday,
    // initialFocusDate: DateTime(2023, 5),
    // initialDateSelected: DateTime(2022, 3, 15),
    // endDateSelected: DateTime(2022, 3, 20),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 3 +
                    MediaQuery.of(context).size.height / 3,
                child: ScrollableCleanCalendar(
                  calendarController: calendarController,
                  layout: Layout.BEAUTY,
                  daySelectedBackgroundColor: AppColors.color1,
                  daySelectedBackgroundColorBetween: AppColors.primary,


                ),
              ),
              SizedBox(
                height: 150,
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomButton(
                          text: 'Cansel',
                          color: AppColors.buttonBackground,
                          onClick: () {},
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomButton(
                          text: 'Set Data',
                          color: AppColors.primary,
                          onClick: () {
                            // print('calendarController.onRangeSelected');
                            // print(calendarController.weekdayStart);
                            // // calendarController.clearSelectedDates();
                            // print(calendarController.endDateSelected);
                          },
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
