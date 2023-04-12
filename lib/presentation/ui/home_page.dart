import 'package:flutter/material.dart';
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
        automaticallyImplyLeading: false,
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
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: appLightPrimaryColor,
              ))
        ],
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
                  style: textTheme.titleLarge!.copyWith(
                    color: appLightGreyColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'M Ramdhan Syahputra',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.headlineSmall!.copyWith(
                    color: appLightPrimaryTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  height: MediaQuery.of(context).size.height * .2,
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
                            height: 115,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/book_icon.svg',
                                  color: Colors.white,
                                  height: 20,
                                ),
                                const SizedBox(width: 6),
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
                            const SizedBox(height: 8),
                            Text(
                              'Ayah No: 1',
                              style: textTheme.bodyMedium!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'Menu',
                  style: textTheme.titleLarge!
                      .copyWith(color: appLightPrimaryTextColor),
                ),
                const SizedBox(height: 24),
                _buildMenuTile(
                  gradientColor1: appLightGreenMenuColor,
                  gradientColor2: appLightPurpleMenuColor,
                  title: 'Read Qur\'an',
                  subtitle: 'Menu 1',
                  textTheme: textTheme,
                  svgIcon: SvgPicture.asset(
                    'assets/quran_icon.svg',
                    color: Colors.white,
                    alignment: Alignment.center,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, SurahPage.routeName);
                  },
                ),
                const SizedBox(height: 16),
                _buildMenuTile(
                  gradientColor1: appLightBlueMenuColor,
                  gradientColor2: appLightPurpleMenuColor,
                  title: 'Sholat Time',
                  subtitle: 'Menu 2',
                  textTheme: textTheme,
                  svgIcon: SvgPicture.asset(
                    'assets/prayer_man_icon.svg',
                    color: Colors.white,
                    alignment: Alignment.center,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, SholatTimePage.routeName);
                  },
                ),
                const SizedBox(height: 16),
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
          style: textTheme.bodyLarge!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: textTheme.bodyMedium!.copyWith(color: Colors.white),
        ),
        leading: icon ?? svgIcon,
        onTap: onTap,
      ),
    );
  }
}
