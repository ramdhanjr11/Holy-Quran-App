import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:holy_quran_app/common/themes.dart';
import 'package:holy_quran_app/presentation/ui/widgets/surah_page_widgets/search_surah_widget.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SliverAppBar(
      floating: true,
      snap: true,
      title: Text(
        'Quran App',
        style: textTheme.titleLarge!.copyWith(
          color: appLightPrimaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: false,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset('assets/menu_icon.svg'),
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
    );
  }
}
