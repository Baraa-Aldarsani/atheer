import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:atheer/features/home/presentation/widgets/bottom_nav_bar.dart';
import 'package:atheer/features/quran/presentation/pages/surah_list_page.dart';
import 'package:atheer/features/search/presentation/pages/search_page.dart';
import 'package:atheer/features/favorites/presentation/pages/favorites_page.dart';
import 'package:atheer/features/notes/presentation/pages/notes_page.dart';
import 'package:atheer/features/settings/presentation/pages/settings_page.dart';
import 'package:atheer/features/quran/presentation/bloc/surah_list/surah_list_cubit.dart';
import 'package:atheer/features/search/presentation/bloc/search_cubit.dart';
import 'package:atheer/core/routes/route_names.dart';
import 'package:atheer/core/theme/app_colors.dart';
import 'package:atheer/injection.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  static const _titles = ['أثير', 'البحث في القرآن', 'المفضلة', 'الملاحظات', 'الإعدادات'];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<SurahListCubit>()),
        BlocProvider(create: (_) => sl<SearchCubit>()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _titles[_currentIndex],
            style: _currentIndex == 0
                ? GoogleFonts.amiri(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accentLight,
                  )
                : null,
          ),
        ),
        body: Column(
          children: [
            const _AppBarExtension(),
            Expanded(
              child: IndexedStack(
                index: _currentIndex,
                children: const [
                  SurahListPage(),
                  SearchPage(),
                  FavoritesPage(),
                  NotesPage(),
                  SettingsPage(),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: _currentIndex == 0
            ? FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RouteNames.mushaf,
                    arguments: {'page': 1},
                  );
                },
                tooltip: 'المصحف الشريف',
                child: const Icon(Icons.auto_stories_rounded),
              )
            : null,
        bottomNavigationBar: BottomNavBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
        ),
      ),
    );
  }
}

class _AppBarExtension extends StatelessWidget {
  const _AppBarExtension();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Leg(isLeft: true),
          const Expanded(child: _CenterOrnament()),
          _Leg(isLeft: false),
        ],
      ),
    );
  }
}

class _CenterOrnament extends StatelessWidget {
  const _CenterOrnament();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final ornamentColor = isDark ? AppColors.accentLight : AppColors.accent;
    final glowColor = isDark ? AppColors.accentLight : AppColors.accentLight;

    return SizedBox(
      height: 22,
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ornamentColor.withValues(alpha: 0.0),
                    ornamentColor.withValues(alpha: 0.6),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Transform.rotate(
            angle: 0.785398,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: ornamentColor,
                boxShadow: [
                  BoxShadow(
                    color: glowColor.withValues(alpha: isDark ? 0.8 : 0.6),
                    blurRadius: isDark ? 8 : 6,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 4),
          Container(
            width: 4,
            height: 4,
            decoration: BoxDecoration(
              color: ornamentColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 4,
            height: 4,
            decoration: BoxDecoration(
              color: ornamentColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 4),
          Transform.rotate(
            angle: 0.785398,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: ornamentColor,
                boxShadow: [
                  BoxShadow(
                    color: glowColor.withValues(alpha: isDark ? 0.8 : 0.6),
                    blurRadius: isDark ? 8 : 6,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ornamentColor.withValues(alpha: 0.6),
                    ornamentColor.withValues(alpha: 0.0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Leg extends StatelessWidget {
  final bool isLeft;
  const _Leg({required this.isLeft});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: 56,
      height: 22,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: isLeft ? Radius.zero : const Radius.circular(22),
          bottomRight: isLeft ? const Radius.circular(22) : Radius.zero,
        ),
      ),
    );
  }
}
