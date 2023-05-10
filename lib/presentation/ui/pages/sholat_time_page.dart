import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timeline_calendar/timeline/model/calendar_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/day_options.dart';
import 'package:flutter_timeline_calendar/timeline/model/headers_options.dart';
import 'package:flutter_timeline_calendar/timeline/utils/calendar_types.dart';
import 'package:flutter_timeline_calendar/timeline/widget/timeline_calendar.dart';
import 'package:holy_quran_app/common/themes.dart';
import 'package:holy_quran_app/presentation/blocs/sholat_time_bloc/sholat_time_bloc.dart';
import 'package:holy_quran_app/presentation/ui/pages/qiblah_page.dart';
import 'package:holy_quran_app/presentation/ui/widgets/sholat_time_page_widgets/sholat_time_tile_widget.dart';

class SholatTimePage extends StatefulWidget {
  static const routeName = '/sholat_time_page';

  const SholatTimePage({super.key});

  @override
  State<SholatTimePage> createState() => _SholatTimePageState();
}

class _SholatTimePageState extends State<SholatTimePage> {
  final dateSelected = DateTime.now();

  void _setDateTime(DateTime date) {
    context.read<SholatTimeBloc>().add(GetSholatTimeEvent(date: date));
  }

  @override
  void initState() {
    super.initState();
    context.read<SholatTimeBloc>().add(GetSholatTimeEvent(date: dateSelected));
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            automaticallyImplyLeading: false,
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
            actions: [
              IconButton(
                icon: Icon(
                  Icons.explore,
                  color: appLightPrimaryColor,
                  size: 35,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QiblahPage(),
                    ),
                  );
                },
              ),
            ],
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
                  weekDaySelectedColor: appLightPrimaryColor,
                ),
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
                },
              ),
              const SizedBox(height: 32),
              BlocBuilder<SholatTimeBloc, SholatTimeState>(
                builder: (context, state) {
                  if (state is SholatTimeLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is SholatTimeError) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else if (state is SholatTimeLoaded) {
                    return SholatTimeTile(sholatTime: state.sholatTime);
                  } else {
                    return const Center(
                      child: Text('Oopss someting went wrong...'),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
