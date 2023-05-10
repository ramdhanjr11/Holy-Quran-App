import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:holy_quran_app/common/themes.dart';
import 'package:holy_quran_app/presentation/ui/pages/qiblah_compass_page.dart';

class QiblahPage extends StatefulWidget {
  const QiblahPage({super.key});

  @override
  State<QiblahPage> createState() => _QiblahPageState();
}

class _QiblahPageState extends State<QiblahPage> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        title: Text(
          'Qiblah',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: appLightPrimaryColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.grey),
      ),
      body: FutureBuilder(
        future: _deviceSupport,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return const QiblahCompassPage();
          }

          if (snapshot.data!) {
            return const QiblahCompassPage();
          } else {
            return const Center(
              child: Text('Oops something wrong..'),
            );
          }
        },
      ),
    );
  }
}
