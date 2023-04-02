import 'package:flutter/material.dart';
import 'package:flutter_timeline_calendar/timeline/model/calendar_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/day_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/headers_options.dart';
import 'package:flutter_timeline_calendar/timeline/utils/calendar_types.dart';
import 'package:flutter_timeline_calendar/timeline/widget/timeline_calendar.dart';
import 'package:holy_quran_app/common/themes.dart';

class SholatTimePage extends StatefulWidget {
  static const routeName = '/sholat_time_page';

  const SholatTimePage({super.key});

  @override
  State<SholatTimePage> createState() => _SholatTimePageState();
}

class _SholatTimePageState extends State<SholatTimePage> {
  DateTime dateSelected = DateTime.now();

  void _setDateTime(DateTime date) {
    setState(() {
      dateSelected = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            floating: true,
            snap: true,
            title: Text(
              'Sholat Time',
              style: textTheme.titleLarge!.copyWith(
                color: appLightPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: false,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
        ],
        physics: const BouncingScrollPhysics(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              TimelineCalendar(
                calendarType: CalendarType.GREGORIAN,
                calendarLanguage: "en",
                calendarOptions: CalendarOptions(
                  viewType: ViewType.DAILY,
                  toggleViewType: true,
                  headerMonthElevation: 10,
                  headerMonthShadowColor: Colors.black26,
                  headerMonthBackColor: Colors.transparent,
                ),
                dayOptions: DayOptions(
                    compactMode: false,
                    selectedBackgroundColor: appLightPrimaryColor,
                    weekDaySelectedColor: appLightPrimaryColor),
                headerOptions: HeaderOptions(
                    navigationColor: Colors.white,
                    calendarIconColor: Colors.white,
                    resetDateColor: Colors.white,
                    weekDayStringType: WeekDayStringTypes.SHORT,
                    monthStringType: MonthStringTypes.FULL,
                    backgroundColor: appLightSecondaryColor,
                    headerTextColor: Colors.white),
                onChangeDateTime: (datetime) {
                  _setDateTime(datetime.toDateTime());
                  print(datetime.getDate());
                },
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
