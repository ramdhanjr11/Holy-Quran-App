// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:holy_quran_app/common/themes.dart';

import 'package:holy_quran_app/domain/entities/surah_detail.dart';

class SurahDetailBanner extends StatelessWidget {
  final SurahDetail surahDetail;

  const SurahDetailBanner({
    Key? key,
    required this.surahDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          width: MediaQuery.of(context).size.width * .9,
          height: MediaQuery.of(context).size.height * .35,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                appLightPurpleColor,
                appLightPrimaryColor,
              ],
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x19000000),
                blurRadius: 24,
                offset: Offset(0, 20),
              ),
            ],
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 30,
          child: Opacity(
            opacity: .1,
            child: SvgPicture.asset(
              'assets/quran_item.svg',
              width: 300.w,
            ),
          ),
        ),
        Center(
          child: Column(
            children: [
              Text(
                surahDetail.latinName,
                style: textTheme.headlineMedium!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                surahDetail.means,
                style: textTheme.headlineSmall!.copyWith(color: Colors.white),
              ),
              SizedBox(height: 12.h),
              SizedBox(
                width: 250.w,
                child: const Divider(
                  height: 4,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                '${surahDetail.type} : ${surahDetail.totalAyah}',
                style: textTheme.titleMedium!.copyWith(color: Colors.white),
              ),
              SizedBox(height: 32.h),
              SvgPicture.asset(
                'assets/basmallah_item.svg',
                width: 260.w,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
