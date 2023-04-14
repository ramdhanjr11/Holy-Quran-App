import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:holy_quran_app/common/themes.dart';
import 'package:holy_quran_app/presentation/ui/saved_ayah_page.dart';
import 'package:holy_quran_app/presentation/ui/sholat_time_page.dart';
import 'package:holy_quran_app/presentation/ui/surah_page.dart';

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
        automaticallyImplyLeading: true,
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
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: 135.h,
              color: appLightPrimaryColor,
              child: Stack(
                clipBehavior: Clip.antiAlias,
                children: [
                  Positioned(
                    bottom: -20,
                    right: -20,
                    child: Opacity(
                      opacity: .2,
                      child: SvgPicture.asset(
                        'assets/quran_item.svg',
                        width: 180.h,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ListTile(
                      title: Text(
                        'M Ramdhan Syahputra',
                        style:
                            textTheme.bodyMedium!.copyWith(color: Colors.white),
                      ),
                      subtitle: Text(
                        'ramdhanjr690@gmail.com',
                        style:
                            textTheme.bodySmall!.copyWith(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: Text(
                'Logout',
                style: textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
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
                  'M Ramdhan Syahputra',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleMedium!.copyWith(
                    color: appLightPrimaryTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.h),
                Container(
                  height: 130.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        appLightPurpleColor,
                        appLightPrimaryColor,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          bottom: -20,
                          right: -20,
                          child: SvgPicture.asset(
                            'assets/quran_item.svg',
                            height: 100.h,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/book_icon.svg',
                                  colorFilter: const ColorFilter.mode(
                                    Colors.white,
                                    BlendMode.srcIn,
                                  ),
                                  height: 12.h,
                                ),
                                SizedBox(width: 6.w),
                                Text(
                                  'Last Read',
                                  style: textTheme.bodyMedium!.copyWith(
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            const Spacer(),
                            Text(
                              'Al-Fatiah',
                              style: textTheme.bodyLarge!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'Ayah No: 1',
                              style: textTheme.bodySmall!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
                Text(
                  'Menu',
                  style: textTheme.titleMedium!
                      .copyWith(color: appLightPrimaryTextColor),
                ),
                SizedBox(height: 16.h),
                _buildMenuTile(
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
                _buildMenuTile(
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
                _buildMenuTile(
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

  Widget _buildMenuTile({
    required Color gradientColor1,
    required Color gradientColor2,
    required String title,
    required String subtitle,
    SvgPicture? svgIcon,
    Icon? icon,
    required TextTheme textTheme,
    required Function() onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            gradientColor1,
            gradientColor2,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        title: Text(
          title,
          style: textTheme.bodyMedium!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: textTheme.bodySmall!.copyWith(color: Colors.white),
        ),
        leading: icon ?? svgIcon,
        onTap: onTap,
      ),
    );
  }
}
