import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_quran_app/common/themes.dart';
import 'package:holy_quran_app/presentation/blocs/surah_bloc/surah_bloc.dart';
import 'package:holy_quran_app/presentation/ui/surah_detail_page.dart';
import 'package:holy_quran_app/presentation/ui/widgets/surah_page_widgets/search_surah_widget.dart';
import 'package:holy_quran_app/presentation/ui/widgets/surah_page_widgets/surah_tile_widget.dart';

class SurahPage extends StatefulWidget {
  static const routeName = '/surah_page';

  const SurahPage({super.key});

  @override
  State<SurahPage> createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SurahBloc>(context).add(GetSurahEvent());
  }

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
                onPressed: () {
                  showSearch(context: context, delegate: SearchSurah());
                },
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
        body: BlocBuilder<SurahBloc, SurahState>(
          builder: (context, state) {
            if (state is SurahLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SurahError) {
              return Center(
                child: Text(
                  state.message,
                  textAlign: TextAlign.center,
                ),
              );
            } else if (state is SurahLoaded) {
              final surahList = state.surahList;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    _buildQuoteBanner(context),
                    ListView.separated(
                      shrinkWrap: true,
                      primary: false,
                      itemBuilder: (context, index) {
                        final surah = surahList[index];
                        return SurahTile(
                          surahNumber: surah.number.toString(),
                          surahLatinName: surah.latinName,
                          surahName: surah.name,
                          surahSubtitle: "${surah.type} : ${surah.totalAyah}",
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SurahDetailPage(surah: surah),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: surahList.length,
                    ),
                  ],
                ),
              );
            } else {
              return const Center(
                child: Text('Oops someting went wrong..'),
              );
            }
          },
        ),
      ),
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
