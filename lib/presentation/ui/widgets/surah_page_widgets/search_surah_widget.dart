import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_quran_app/presentation/blocs/search_surah_bloc/search_surah_bloc.dart';
import 'package:holy_quran_app/presentation/ui/surah_detail_page.dart';
import 'package:holy_quran_app/presentation/ui/widgets/surah_page_widgets/surah_tile_widget.dart';

class SearchSurah extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final surahBloc = context.read<SearchSurahBloc>();
    surahBloc.add(SearchSurahOnQuery(query: query));
    return BlocBuilder<SearchSurahBloc, SearchSurahState>(
      builder: (context, state) {
        if (state is SearchSurahLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SearchSurahError) {
          return Center(
            child: Text(state.message),
          );
        } else if (state is SearchSurahInitial) {
          return const Center(
            child: Text('Begin to search the surah...'),
          );
        } else if (state is SearchSurahLoaded) {
          return ListView.separated(
            itemBuilder: (context, index) {
              final surah = state.surahList[index];
              return SurahTile(
                surahNumber: surah.number.toString(),
                surahLatinName: surah.latinName,
                surahName: surah.name,
                surahSubtitle: "${surah.type} : ${surah.totalAyah}",
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SurahDetailPage(id: surah.number),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: state.surahList.length,
          );
        } else {
          return const Center(
            child: Text('Oops someting went wrong...'),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
