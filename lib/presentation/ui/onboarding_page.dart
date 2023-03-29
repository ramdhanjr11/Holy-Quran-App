import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:holy_quran_app/common/themes.dart';
import 'package:holy_quran_app/presentation/ui/home_page.dart';

class OnBoardingPage extends StatelessWidget {
  static const routeName = '/onboarding_page';

  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Quran App',
              style: GoogleFonts.poppins(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: appLightPrimaryColor,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Learn Quran and',
              style: textTheme.titleMedium!.copyWith(color: appLightGreyColor),
            ),
            const SizedBox(height: 2),
            Text(
              'Recite once everyday',
              style: textTheme.titleMedium!.copyWith(color: appLightGreyColor),
            ),
            const SizedBox(height: 64),
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                SvgPicture.asset(
                  'assets/onboarding_item.svg',
                  height: height * .53,
                ),
                Positioned(
                  bottom: -23,
                  child: SizedBox(
                    height: 60,
                    width: 170,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        backgroundColor: appLightOrangeColor,
                      ),
                      child: Text(
                        'Get Started',
                        style: textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, HomePage.routeName);
                      },
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}