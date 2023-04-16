import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:holy_quran_app/common/themes.dart';
import 'package:holy_quran_app/presentation/ui/pages/home_page.dart';

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
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: appLightPrimaryColor,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Learn Quran and',
              style: textTheme.titleSmall!.copyWith(color: appLightGreyColor),
            ),
            SizedBox(height: 2.h),
            Text(
              'Recite once everyday',
              style: textTheme.titleSmall!.copyWith(color: appLightGreyColor),
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
                    height: 60.sp,
                    width: 170.sp,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        backgroundColor: appLightOrangeColor,
                      ),
                      child: Text(
                        'Get Started',
                        style: textTheme.bodyMedium!.copyWith(
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
