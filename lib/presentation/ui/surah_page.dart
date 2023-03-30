import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:holy_quran_app/common/themes.dart';
import 'package:holy_quran_app/presentation/ui/surah_detail_page.dart';

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
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            floating: true,
            snap: true,
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
        ],
        physics: const BouncingScrollPhysics(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 16),
              _buildQuoteBanner(context),
              ListView.separated(
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) => _buildSurahTile(
                  surahNumber: index.toString(),
                  surahLatinName: "Al-Fatihah",
                  surahName: "ةحتافلا",
                  surahSubtitle: "Meccan : 7 VERSES",
                  onTap: () => Navigator.pushNamed(
                    context,
                    SurahDetailPage.routeName,
                  ),
                ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListTile _buildSurahTile({
    required String surahNumber,
    required String surahLatinName,
    required String surahName,
    required String surahSubtitle,
    required Function() onTap,
  }) {
    return ListTile(
      leading: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset('assets/number_icon.svg'),
          Positioned(
            child: Text(surahNumber),
          ),
        ],
      ),
      title: Text(surahLatinName),
      subtitle: Text(surahSubtitle),
      trailing: Text(
        surahName,
        style: TextStyle(fontSize: 24, color: appLightPrimaryColor),
      ),
      onTap: onTap,
    );
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
