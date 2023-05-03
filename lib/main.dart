import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holy_quran_app/common/constants.dart';
import 'package:holy_quran_app/common/themes.dart';
import 'package:holy_quran_app/domain/entities/surah.dart';
import 'package:holy_quran_app/presentation/blocs/article_bloc/article_bloc.dart';
import 'package:holy_quran_app/presentation/blocs/ayah_bloc/ayah_bloc.dart';
import 'package:holy_quran_app/presentation/blocs/dua_bloc/dua_bloc.dart';
import 'package:holy_quran_app/presentation/blocs/saved_ayah_status_bloc/saved_ayah_status_bloc.dart';
import 'package:holy_quran_app/presentation/blocs/search_article_bloc/search_article_bloc.dart';
import 'package:holy_quran_app/presentation/blocs/search_surah_bloc/search_surah_bloc.dart';
import 'package:holy_quran_app/presentation/blocs/sholat_time_bloc/sholat_time_bloc.dart';
import 'package:holy_quran_app/presentation/blocs/surah_bloc/surah_bloc.dart';
import 'package:holy_quran_app/presentation/blocs/surah_detail_bloc/surah_detail_bloc.dart';
import 'package:holy_quran_app/presentation/ui/pages/home_page.dart';
import 'package:holy_quran_app/presentation/ui/pages/onboarding_page.dart';
import 'package:holy_quran_app/presentation/ui/pages/saved_ayah_page.dart';
import 'package:holy_quran_app/presentation/ui/pages/sholat_time_page.dart';
import 'package:holy_quran_app/presentation/ui/pages/surah_detail_page.dart';
import 'package:holy_quran_app/presentation/ui/pages/surah_page.dart';
import 'injection.dart' as di;

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _blocProviders,
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Holy Quran App',
          theme: ThemeData(
            primaryColor: appLightPrimaryColor,
            textTheme: appTextTheme,
          ),
          navigatorObservers: [routeObserver],
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/':
                return MaterialPageRoute(
                  builder: (context) => const OnBoardingPage(),
                );
              case HomePage.routeName:
                return MaterialPageRoute(
                  builder: (context) => const HomePage(),
                );
              case SurahPage.routeName:
                return MaterialPageRoute(
                  builder: (context) => const SurahPage(),
                );
              case SurahDetailPage.routeName:
                final arg = settings.arguments as Surah;
                return MaterialPageRoute(
                  builder: (context) => SurahDetailPage(surah: arg),
                );
              case SholatTimePage.routeName:
                return MaterialPageRoute(
                  builder: (context) => const SholatTimePage(),
                );
              case SavedAyahPage.routeName:
                return MaterialPageRoute(
                  builder: (context) => const SavedAyahPage(),
                );
              default:
                return MaterialPageRoute(builder: (_) {
                  return const Scaffold(
                    body: Center(
                      child: Text('Page not found :('),
                    ),
                  );
                });
            }
          },
        ),
      ),
    );
  }

  get _blocProviders {
    return [
      BlocProvider<SurahBloc>(
        create: (context) => di.locator(),
      ),
      BlocProvider<SurahDetailBloc>(
        create: (context) => di.locator(),
      ),
      BlocProvider<SearchSurahBloc>(
        create: (context) => di.locator(),
      ),
      BlocProvider<SholatTimeBloc>(
        create: (context) => di.locator(),
      ),
      BlocProvider<AyahBloc>(
        create: (context) => di.locator(),
      ),
      BlocProvider<SavedAyahStatusBloc>(
        create: (context) => di.locator(),
      ),
      BlocProvider<ArticleBloc>(
        create: (context) => di.locator(),
      ),
      BlocProvider<SearchArticleBloc>(
        create: (context) => di.locator(),
      ),
      BlocProvider<DuaBloc>(
        create: (context) => di.locator(),
      ),
    ];
  }
}
