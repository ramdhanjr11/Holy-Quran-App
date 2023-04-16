// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeMenuTile extends StatelessWidget {
  final Color gradientColor1;
  final Color gradientColor2;
  final String title;
  final String subtitle;
  final SvgPicture? svgIcon;
  final Icon? icon;
  final TextTheme textTheme;
  final Function() onTap;

  const HomeMenuTile({
    Key? key,
    required this.gradientColor1,
    required this.gradientColor2,
    required this.title,
    required this.subtitle,
    this.svgIcon,
    this.icon,
    required this.textTheme,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            gradientColor1,
            gradientColor2,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        title: Text(
          title,
          style: textTheme.bodyMedium!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: textTheme.bodySmall!.copyWith(color: Colors.white),
        ),
        leading: icon ?? svgIcon,
        onTap: onTap,
      ),
    );
  }
}
