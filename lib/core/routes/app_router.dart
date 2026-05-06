import 'package:flutter/material.dart';
import 'package:atheer/core/routes/route_names.dart';
import 'package:atheer/features/home/presentation/pages/home_page.dart';
import 'package:atheer/features/quran/presentation/pages/reader_page.dart';
import 'package:atheer/features/quran/presentation/pages/mushaf_page.dart';
import 'package:atheer/features/splash/presentation/pages/splash_page.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case RouteNames.reader:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => ReaderPage(
            surahNumber: args['surahNumber'] as int,
            initialAyah: args['initialAyah'] as int? ?? 1,
          ),
        );
      case RouteNames.mushaf:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) => MushafPage(
            initialPage: args?['page'] as int? ?? 1,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
