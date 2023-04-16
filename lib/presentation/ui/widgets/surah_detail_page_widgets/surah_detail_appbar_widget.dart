// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:holy_quran_app/common/themes.dart';
import 'package:holy_quran_app/domain/entities/surah.dart';

class SurahDetailAppBar extends StatelessWidget {
  final Surah surah;
  final Function(int) onSearchSubmitted;

  const SurahDetailAppBar({
    Key? key,
    required this.surah,
    required this.onSearchSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
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
                      onSearchSubmitted(int.parse(value));
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
