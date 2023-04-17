import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:holy_quran_app/common/themes.dart';
import 'package:holy_quran_app/domain/entities/surah.dart';
import 'package:holy_quran_app/presentation/blocs/surah_bloc/surah_bloc.dart';
import 'package:holy_quran_app/presentation/ui/pages/saved_ayah_page.dart';
import 'package:holy_quran_app/presentation/ui/pages/sholat_time_page.dart';
import 'package:holy_quran_app/presentation/ui/pages/surah_detail_page.dart';
import 'package:holy_quran_app/presentation/ui/widgets/home_page_widgets/home_appbar_widget.dart';
import 'package:holy_quran_app/presentation/ui/widgets/home_page_widgets/home_banner_widget.dart';
import 'package:holy_quran_app/presentation/ui/widgets/surah_page_widgets/surah_tile_widget.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndexBottomNav = 0;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<SurahBloc>(context).add(GetSurahEvent());
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    void onItemNavBarTapped(int index) {
      setState(() {
        currentIndexBottomNav = index;
      });
    }

    List<Widget> pages = [
      _homeContent(textTheme),
      const Placeholder(),
      const SholatTimePage(),
      const Placeholder(),
      const SavedAyahPage(),
    ];

    var bottomNavItems = [
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/quran_icon.svg',
          colorFilter: ColorFilter.mode(
            currentIndexBottomNav == 0 ? appLightPrimaryColor : Colors.grey,
            BlendMode.srcIn,
          ),
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/lamp_icon.svg',
          colorFilter: ColorFilter.mode(
            currentIndexBottomNav == 1 ? appLightPrimaryColor : Colors.grey,
            BlendMode.srcIn,
          ),
        ),
        label: 'Idea',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/prayer_man_icon.svg',
          colorFilter: ColorFilter.mode(
            currentIndexBottomNav == 2 ? appLightPrimaryColor : Colors.grey,
            BlendMode.srcIn,
          ),
        ),
        label: 'Prayer Time',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/dua_icon.svg',
          colorFilter: ColorFilter.mode(
            currentIndexBottomNav == 3 ? appLightPrimaryColor : Colors.grey,
            BlendMode.srcIn,
          ),
        ),
        label: 'Dua',
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.bookmark_outline,
          size: 35,
        ),
        label: 'Bookmark',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: pages.elementAt(currentIndexBottomNav),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(color: appLightPrimaryColor),
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        currentIndex: currentIndexBottomNav,
        onTap: onItemNavBarTapped,
        selectedItemColor: appLightPrimaryColor,
        items: bottomNavItems,
      ),
    );
  }

  _homeContent(TextTheme textTheme) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        const HomeAppbar(),
      ],
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Text(
                'Assalamualaikum',
                style: textTheme.titleMedium!.copyWith(
                  color: appLightGreyColor,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                'M Ramdhan Syahputra',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.titleMedium!.copyWith(
                  color: appLightPrimaryTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.h),
              const HomeBanner(),
              SizedBox(height: 8.h),
              BlocBuilder<SurahBloc, SurahState>(
                builder: (context, state) {
                  if (state is SurahLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is SurahError) {
                    return Center(
                      child: Text(
                        state.message,
                        textAlign: TextAlign.center,
                      ),
                    );
                  } else if (state is SurahLoaded) {
                    final surahList = state.surahList;
                    return _surahContent(surahList);
                  } else {
                    return const Center(
                      child: Text('Oops someting went wrong..'),
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

  ListView _surahContent(List<Surah> surahList) {
    return ListView.separated(
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemBuilder: (context, index) {
        final surah = surahList[index];
        return SurahTile(
          surahNumber: surah.number.toString(),
          surahLatinName: surah.latinName,
          surahName: surah.name,
          surahSubtitle: "${surah.type} : ${surah.totalAyah}",
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SurahDetailPage(surah: surah),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
      itemCount: surahList.length,
    );
  }
}
