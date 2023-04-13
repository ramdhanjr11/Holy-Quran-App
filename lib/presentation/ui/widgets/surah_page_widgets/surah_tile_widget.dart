import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:holy_quran_app/common/themes.dart';

class SurahTile extends StatelessWidget {
  String surahNumber;
  String surahLatinName;
  String surahName;
  String surahSubtitle;
  Function() onTap;

  SurahTile({
    super.key,
    required this.surahNumber,
    required this.surahLatinName,
    required this.surahName,
    required this.surahSubtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      leading: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset('assets/number_icon.svg'),
          Positioned(
            child: Text(surahNumber),
          ),
        ],
      ),
      title: Text(
        surahLatinName,
        style: textTheme.titleMedium,
      ),
      subtitle: Text(
        surahSubtitle,
        style: textTheme.bodyMedium,
      ),
      trailing: Text(
        surahName,
        style: TextStyle(fontSize: 24, color: appLightPrimaryColor),
      ),
      onTap: onTap,
    );
  }
}
