import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:holy_quran_app/common/themes.dart';
import 'package:holy_quran_app/domain/entities/ayah.dart';
import 'package:holy_quran_app/domain/entities/surah.dart';
import 'package:holy_quran_app/domain/entities/surah_detail.dart';
import 'package:holy_quran_app/presentation/blocs/surah_detail_bloc/surah_detail_bloc.dart';
import 'package:holy_quran_app/presentation/ui/widgets/ayah_item_widget.dart';
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

  @override
  void initState() {
    super.initState();
    BlocProvider.of<SurahDetailBloc>(context)
        .add(GetSurahDetailEvent(id: widget.surah.number));
    surah = widget.surah;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    late SurahDetail surahDetail;
    late List<Ayah> ayah;

    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          _buildSliverAppBar(textTheme, context),
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
              ayah = surahDetail.surahAyah;
              return ScrollablePositionedList.builder(
                shrinkWrap: true,
                itemCount: surahDetail.totalAyah + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Column(
                      children: [
                        _buildSurahBanner(context, surahDetail, textTheme),
                        const SizedBox(height: 24),
                      ],
                    );
                  }
                  return AyahItem(ayah: ayah[index - 1]);
                },
                itemScrollController: itemScrollController,
                itemPositionsListener: itemPositionsListener,
              );
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

  Stack _buildSurahBanner(
    BuildContext context,
    SurahDetail surahDetail,
    TextTheme textTheme,
  ) {
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

  SliverAppBar _buildSliverAppBar(
    TextTheme textTheme,
    BuildContext context,
  ) {
    return SliverAppBar(
      floating: true,
      snap: true,
      title: Text(
        surah.latinName,
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
            _buildSearchDialog(context, textTheme);
          },
          icon: const Icon(
            Icons.search,
            color: Colors.grey,
            size: 30,
          ),
        ),
      ],
    );
  }

  Future<dynamic> _buildSearchDialog(
    BuildContext context,
    TextTheme textTheme,
  ) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: SizedBox(
            height: 200,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Find ayah from 1 - ${surah.totalAyah}',
                    style: textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: appLightPrimaryColor),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: 100,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    textAlign: TextAlign.center,
                    onFieldSubmitted: (value) {
                      Navigator.pop(context);
                      // scrollController.jumpTo(int.parse(value) - 1);
                      itemScrollController.scrollTo(
                        index: int.parse(value),
                        duration: const Duration(seconds: 2),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
