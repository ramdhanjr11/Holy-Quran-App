import 'package:flutter/material.dart';
import 'package:holy_quran_app/common/themes.dart';
import 'package:holy_quran_app/presentation/ui/widgets/dua_page_widgets.dart/dua_search_widget.dart';

class DuaAppbar extends StatelessWidget {
  const DuaAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SliverAppBar(
      automaticallyImplyLeading: false,
      floating: true,
      snap: true,
      title: Text(
        'Dua',
        style: textTheme.titleLarge!.copyWith(
          color: appLightPrimaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: false,
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () {
            showSearch(context: context, delegate: DuaSearch());
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
