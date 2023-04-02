import 'package:flutter/material.dart';
import 'package:holy_quran_app/common/themes.dart';
import 'package:holy_quran_app/domain/entities/sholat_time.dart';

class SholatTimeTile extends StatelessWidget {
  final SholatTime sholatTime;

  const SholatTimeTile({super.key, required this.sholatTime});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTimeCardItem(
          context,
          waktuSholat: "subuh",
          jadwalSholat: sholatTime.subuh,
        ),
        _buildTimeCardItem(
          context,
          waktuSholat: "imsak",
          jadwalSholat: sholatTime.imsak,
        ),
        _buildTimeCardItem(
          context,
          waktuSholat: "dhuha",
          jadwalSholat: sholatTime.dhuha,
        ),
        _buildTimeCardItem(
          context,
          waktuSholat: "dzuhur",
          jadwalSholat: sholatTime.dzuhur,
        ),
        _buildTimeCardItem(
          context,
          waktuSholat: "ashar",
          jadwalSholat: sholatTime.ashar,
        ),
        _buildTimeCardItem(
          context,
          waktuSholat: "maghrib",
          jadwalSholat: sholatTime.maghrib,
        ),
        _buildTimeCardItem(
          context,
          waktuSholat: "isya",
          jadwalSholat: sholatTime.isya,
        ),
      ],
    );
  }

  Card _buildTimeCardItem(
    BuildContext context, {
    required waktuSholat,
    required jadwalSholat,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Icon(
          Icons.av_timer,
          size: 40,
          color: appLightPrimaryColor,
        ),
        title: Text(
          jadwalSholat,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: appLightPrimaryTextColor, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Jadwal sholat $waktuSholat',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: appLightGreyColor),
        ),
      ),
    );
  }
}
