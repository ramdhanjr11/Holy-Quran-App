import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:holy_quran_app/common/themes.dart';
import 'package:holy_quran_app/presentation/ui/pages/saved_ayah_page.dart';
import 'package:holy_quran_app/presentation/ui/pages/sholat_time_page.dart';
import 'package:holy_quran_app/presentation/ui/pages/surah_page.dart';
import 'package:holy_quran_app/presentation/ui/widgets/home_page_widgets/home_banner_widget.dart';
import 'package:holy_quran_app/presentation/ui/widgets/home_page_widgets/home_menu_tile_widget.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(color: appLightPrimaryColor, size: 30),
        backgroundColor: Colors.white,
        centerTitle: false,
        elevation: 0,
        title: Text(
          'Quran App',
          style: textTheme.titleLarge!.copyWith(
            color: appLightPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Assalamualaikum',
                  style: textTheme.titleMedium!.copyWith(
                    color: appLightGreyColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'May God\'s will be blessed upon us',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleMedium!.copyWith(
                    color: appLightPrimaryTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.h),
                const HomeBanner(),
                SizedBox(height: 32.h),
                Text(
                  'Menu',
                  style: textTheme.titleMedium!
                      .copyWith(color: appLightPrimaryTextColor),
                ),
                SizedBox(height: 16.h),
                HomeMenuTile(
                  gradientColor1: appLightGreenMenuColor,
                  gradientColor2: appLightPurpleMenuColor,
                  title: 'Read Qur\'an',
                  subtitle: 'Menu 1',
                  textTheme: textTheme,
                  svgIcon: SvgPicture.asset(
                    'assets/quran_icon.svg',
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                    alignment: Alignment.center,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, SurahPage.routeName);
                  },
                ),
                SizedBox(height: 16.h),
                HomeMenuTile(
                  gradientColor1: appLightBlueMenuColor,
                  gradientColor2: appLightPurpleMenuColor,
                  title: 'Sholat Time',
                  subtitle: 'Menu 2',
                  textTheme: textTheme,
                  svgIcon: SvgPicture.asset(
                    'assets/prayer_man_icon.svg',
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                    alignment: Alignment.center,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, SholatTimePage.routeName);
                  },
                ),
                SizedBox(height: 16.h),
                HomeMenuTile(
                  gradientColor1: appLightOrangeColor,
                  gradientColor2: appLightPurpleMenuColor,
                  title: 'Saved Ayah',
                  subtitle: 'Menu 3',
                  textTheme: textTheme,
                  icon: const Icon(
                    Icons.bookmark_outline,
                    color: Colors.white,
                    size: 30,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, SavedAyahPage.routeName);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
