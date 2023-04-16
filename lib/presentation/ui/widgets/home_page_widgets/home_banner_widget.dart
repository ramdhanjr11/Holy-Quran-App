import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:holy_quran_app/common/themes.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
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
    );
  }
}
