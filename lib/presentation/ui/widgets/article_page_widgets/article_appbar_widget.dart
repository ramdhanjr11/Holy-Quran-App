import 'package:flutter/material.dart';
import 'package:holy_quran_app/common/themes.dart';

class ArticleAppbar extends StatelessWidget {
  const ArticleAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SliverAppBar(
      automaticallyImplyLeading: false,
      floating: true,
      snap: true,
      title: Text(
        'Articles',
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
          onPressed: () {},
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
