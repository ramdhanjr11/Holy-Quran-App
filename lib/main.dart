import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holy_quran_app/common/constants.dart';
import 'package:holy_quran_app/common/themes.dart';
import 'package:holy_quran_app/domain/entities/surah.dart';
import 'package:holy_quran_app/presentation/blocs/search_surah_bloc/search_surah_bloc.dart';
import 'package:holy_quran_app/presentation/blocs/surah_bloc/surah_bloc.dart';
import 'package:holy_quran_app/presentation/blocs/surah_detail_bloc/surah_detail_bloc.dart';
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
      providers: [
        BlocProvider<SurahBloc>(
          create: (context) => di.locator(),
        ),
        BlocProvider<SurahDetailBloc>(
          create: (context) => di.locator(),
        ),
        BlocProvider<SearchSurahBloc>(
          create: (context) => di.locator(),
        ),
      ],
      child: MaterialApp(
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
    );
  }
}
