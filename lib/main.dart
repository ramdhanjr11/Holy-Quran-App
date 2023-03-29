import 'package:flutter/material.dart';
import 'package:holy_quran_app/common/themes.dart';
import 'package:holy_quran_app/presentation/ui/home_page.dart';
import 'package:holy_quran_app/presentation/ui/onboarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Holy Quran App',
      theme: ThemeData(
        primaryColor: appLightPrimaryColor,
        textTheme: appTextTheme,
      ),
      initialRoute: OnBoardingPage.routeName,
      routes: {
        OnBoardingPage.routeName: (_) => const OnBoardingPage(),
        HomePage.routeName: (_) => const HomePage(),
      },
    );
  }
}
