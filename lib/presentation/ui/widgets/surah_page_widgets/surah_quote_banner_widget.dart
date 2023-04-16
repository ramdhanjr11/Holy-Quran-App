import 'dart:math';

import 'package:flutter/material.dart';
import 'package:holy_quran_app/common/themes.dart';

class SurahQuoteBanner extends StatelessWidget {
  const SurahQuoteBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            height: MediaQuery.of(context).size.height * .22,
            width: MediaQuery.of(context).size.width * .9,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color(0x19000000),
                  blurRadius: 24,
                  offset: Offset(0, 11),
                ),
              ],
              gradient: LinearGradient(
                colors: [
                  appLightPurpleColor,
                  appLightPrimaryColor,
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Siapa saja membaca satu huruf dari Kitabullah (Alquran) maka dia akan mendapat satu kebaikan. Sedangkan satu kebaikan dilipatkan kepada sepuluh semisalnya',
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium!.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 35,
          top: -35,
          child: Icon(
            Icons.format_quote,
            size: 70,
            color: appLightSecondaryColor,
          ),
        ),
        Positioned(
          left: 35,
          bottom: -35,
          child: Transform.rotate(
            angle: 1 * pi,
            child: Icon(
              Icons.format_quote,
              size: 70,
              color: appLightSecondaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
