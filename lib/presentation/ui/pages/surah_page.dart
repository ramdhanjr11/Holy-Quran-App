import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_quran_app/common/themes.dart';
import 'package:holy_quran_app/domain/entities/surah.dart';
import 'package:holy_quran_app/presentation/blocs/surah_bloc/surah_bloc.dart';
import 'package:holy_quran_app/presentation/ui/pages/surah_detail_page.dart';
import 'package:holy_quran_app/presentation/ui/widgets/surah_page_widgets/search_surah_widget.dart';
import 'package:holy_quran_app/presentation/ui/widgets/surah_page_widgets/surah_quote_banner_widget.dart';
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
              return _surahContent(surahList);
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

  ListView _surahContent(List<Surah> surahList) {
    return ListView.separated(
      shrinkWrap: true,
      primary: false,
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemBuilder: (context, index) {
        if (index == 0) {
          return Column(
            children: const [
              SurahQuoteBanner(),
              SizedBox(height: 16),
            ],
          );
        }

        final surah = surahList[index - 1];
        return SurahTile(
          surahNumber: surah.number.toString(),
          surahLatinName: surah.latinName,
          surahName: surah.name,
          surahSubtitle: "${surah.type} : ${surah.totalAyah}",
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SurahDetailPage(surah: surah),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
      itemCount: surahList.length + 1,
    );
  }
}
