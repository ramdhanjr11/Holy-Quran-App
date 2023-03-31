import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_quran_app/common/themes.dart';
import 'package:holy_quran_app/presentation/ui/home_page.dart';
import 'package:holy_quran_app/presentation/ui/onboarding_page.dart';
import 'package:holy_quran_app/presentation/ui/surah_detail_page.dart';
import 'package:holy_quran_app/presentation/ui/surah_page.dart';
import 'injection.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: const [],
      child: MaterialApp(
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
          SurahPage.routeName: (_) => const SurahPage(),
          SurahDetailPage.routeName: (_) => const SurahDetailPage(),
        },
      ),
    );
  }
}
