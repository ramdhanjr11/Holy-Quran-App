import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:holy_quran_app/common/themes.dart';
import 'package:holy_quran_app/domain/entities/ayah.dart';
import 'package:holy_quran_app/presentation/blocs/surah_detail_bloc/surah_detail_bloc.dart';

class SurahDetailPage extends StatefulWidget {
  static const routeName = '/surah_detail_page';
  final int id;

  const SurahDetailPage({super.key, required this.id});

  @override
  State<SurahDetailPage> createState() => _SurahDetailPageState();
}

class _SurahDetailPageState extends State<SurahDetailPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SurahDetailBloc>(context)
        .add(GetSurahDetailEvent(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    late List<Ayah> ayah;

    return Scaffold(
      backgroundColor: Colors.white,
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
            final surahDetail = state.surahDetail;
            ayah = surahDetail.surahAyah;
            return NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  floating: true,
                  snap: true,
                  title: Text(
                    surahDetail.latinName,
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
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
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
                              width: 300,
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
                              const SizedBox(height: 8),
                              Text(
                                surahDetail.means,
                                style: textTheme.headlineSmall!
                                    .copyWith(color: Colors.white),
                              ),
                              const SizedBox(height: 12),
                              const SizedBox(
                                width: 250,
                                child: Divider(
                                  height: 4,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                '${surahDetail.type} : ${surahDetail.totalAyah}',
                                style: textTheme.titleMedium!
                                    .copyWith(color: Colors.white),
                              ),
                              const SizedBox(height: 32),
                              SvgPicture.asset(
                                'assets/basmallah_item.svg',
                                width: 260,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      primary: false,
                      itemBuilder: (context, index) => _buildItemAyah(context,
                          ayahNumber: ayah[index].number.toString(),
                          ayah: ayah[index].arab,
                          translate: ayah[index].indonesia),
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: ayah.length,
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: Text('Oopss something went wrong..'),
            );
          }
        },
      ),
    );
  }

  Widget _buildItemAyah(
    BuildContext context, {
    required String ayahNumber,
    required String ayah,
    required String translate,
  }) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey[100],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 16),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: appLightPrimaryColor,
                ),
                child: Center(
                  child: Text(
                    ayahNumber,
                    style: textTheme.titleSmall!.copyWith(color: Colors.white),
                  ),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.share_outlined,
                      color: appLightPrimaryColor,
                      size: 35,
                    ),
                  ),
                  const SizedBox(width: 4),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.play_arrow_outlined,
                      color: appLightPrimaryColor,
                      size: 35,
                    ),
                  ),
                  const SizedBox(width: 4),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.bookmark_outline,
                      color: appLightPrimaryColor,
                      size: 35,
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Text(
            ayah,
            style: TextStyle(
              fontSize: 24,
              color: appLightPrimaryTextColor,
            ),
            textAlign: TextAlign.end,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            translate,
            style:
                textTheme.bodyLarge!.copyWith(color: appLightPrimaryTextColor),
          ),
        ),
      ],
    );
  }
}
