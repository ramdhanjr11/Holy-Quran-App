import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_quran_app/domain/entities/ayah.dart';
import 'package:holy_quran_app/domain/entities/surah.dart';
import 'package:holy_quran_app/domain/entities/surah_detail.dart';
import 'package:holy_quran_app/presentation/blocs/surah_detail_bloc/surah_detail_bloc.dart';
import 'package:holy_quran_app/presentation/ui/widgets/common/ayah_item_widget.dart';
import 'package:holy_quran_app/presentation/ui/widgets/surah_detail_page_widgets/surah_detail_appbar_widget.dart';
import 'package:holy_quran_app/presentation/ui/widgets/surah_detail_page_widgets/surah_detail_banner_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class SurahDetailPage extends StatefulWidget {
  static const routeName = '/surah_detail_page';
  final Surah surah;

  const SurahDetailPage({super.key, required this.surah});

  @override
  State<SurahDetailPage> createState() => _SurahDetailPageState();
}

class _SurahDetailPageState extends State<SurahDetailPage> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  late Surah surah;
  final ScrollController scrollController = ScrollController();
  late SurahDetail surahDetail;
  late List<Ayah> ayahList;

  @override
  void initState() {
    super.initState();
    surah = widget.surah;
    Future.microtask(() {
      context
          .read<SurahDetailBloc>()
          .add(GetSurahDetailEvent(id: widget.surah.number));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SurahDetailAppBar(
            surah: surah,
            onSearchSubmitted: (value) => itemScrollController.scrollTo(
              index: value,
              duration: const Duration(seconds: 2),
            ),
          )
        ],
        physics: const BouncingScrollPhysics(),
        floatHeaderSlivers: true,
        body: BlocBuilder<SurahDetailBloc, SurahDetailState>(
          builder: (context, state) {
            if (state is SurahDetailLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SurahDetailError) {
              return Center(
                child: Text(state.message),
              );
            } else if (state is SurahDetailLoaded) {
              surahDetail = state.surahDetail;
              ayahList = surahDetail.surahAyah;
              return _surahDetailContent();
            } else {
              return const Center(
                child: Text('Oopss something went wrong..'),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _surahDetailContent() {
    return ScrollablePositionedList.builder(
      shrinkWrap: true,
      itemCount: surahDetail.totalAyah + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Column(
            children: [
              SurahDetailBanner(surahDetail: surahDetail),
              const SizedBox(height: 24),
            ],
          );
        }
        final ayah = ayahList[index - 1];
        return AyahItem(
          key: ValueKey(ayah.ayahId),
          ayah: ayah,
        );
      },
      itemScrollController: itemScrollController,
      itemPositionsListener: itemPositionsListener,
    );
  }
}
