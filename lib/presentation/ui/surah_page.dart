import 'dart:math';

import 'package:flutter/material.dart';
import 'package:holy_quran_app/common/themes.dart';

class SurahPage extends StatefulWidget {
  static const routeName = '/surah_page';

  const SurahPage({super.key});

  @override
  State<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Surah',
            style: textTheme.titleLarge!.copyWith(
              color: appLightPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: false,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.grey,
                size: 30,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              _buildQuoteBanner(context),
            ],
          ),
        ));
  }

  _buildQuoteBanner(BuildContext context) {
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
                  style: textTheme.bodyLarge!.copyWith(color: Colors.white),
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
