import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holy_quran_app/common/themes.dart';
import 'package:holy_quran_app/domain/entities/ayah.dart';
import 'package:holy_quran_app/presentation/blocs/ayah_bloc/ayah_bloc.dart';
import 'package:share_plus/share_plus.dart';

class AyahItem extends StatefulWidget {
  final Ayah ayah;

  const AyahItem({super.key, required this.ayah});

  @override
  State<AyahItem> createState() => _AyahItemState();
}

class _AyahItemState extends State<AyahItem> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final ayah = widget.ayah;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey[100],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 16),
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: appLightPrimaryColor,
                ),
                child: Center(
                  child: Text(
                    ayah.number.toString(),
                    style: textTheme.titleSmall!.copyWith(color: Colors.white),
                  ),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () async {
                      Share.share(
                          'Dont forget to recite ${ayah.surah} : ${ayah.number}');
                    },
                    icon: Icon(
                      Icons.share_outlined,
                      color: appLightPrimaryColor,
                      size: 30,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.play_arrow_outlined,
                      color: appLightPrimaryColor,
                      size: 30,
                    ),
                  ),
                  SizedBox(width: 4.w),
                  IconButton(
                    onPressed: () async {
                      context.read<AyahBloc>().add(InsertAyahEvent(ayah: ayah));
                    },
                    icon: Icon(
                      Icons.bookmark_outline,
                      color: appLightPrimaryColor,
                      size: 30,
                    ),
                  ),
                  SizedBox(width: 16.w),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Text(
            ayah.arab,
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
            ayah.indonesia,
            style:
                textTheme.bodyMedium!.copyWith(color: appLightPrimaryTextColor),
          ),
        ),
        SizedBox(height: 32.h),
      ],
    );
  }
}
