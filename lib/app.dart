import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:atheer/core/theme/app_theme.dart';
import 'package:atheer/core/routes/app_router.dart';
import 'package:atheer/core/routes/route_names.dart';
import 'package:atheer/features/settings/presentation/bloc/settings_cubit.dart';
import 'package:atheer/features/settings/presentation/bloc/settings_state.dart';
import 'package:atheer/features/favorites/presentation/bloc/favorites_cubit.dart';
import 'package:atheer/features/notes/presentation/bloc/notes_cubit.dart';
import 'package:atheer/injection.dart';

class AtheerApp extends StatelessWidget {
  const AtheerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<SettingsCubit>()..loadSettings()),
        BlocProvider(create: (_) => sl<FavoritesCubit>()..loadFavorites()),
        BlocProvider(create: (_) => sl<NotesCubit>()..loadNotes()),
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        buildWhen: (prev, curr) {
          if (prev is SettingsLoaded && curr is SettingsLoaded) {
            return prev.settings.themeMode != curr.settings.themeMode;
          }
          return true;
        },
        builder: (context, state) {
          final themeMode = state is SettingsLoaded
              ? state.settings.themeMode
              : ThemeMode.system;

          return MaterialApp(
            title: 'Atheer',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeMode,
            locale: const Locale('ar'),
            supportedLocales: const [
              Locale('ar'),
              Locale('en'),
            ],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            initialRoute: RouteNames.splash,
            onGenerateRoute: AppRouter.onGenerateRoute,
            builder: (context, child) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: child!,
              );
            },
          );
        },
      ),
    );
  }
}
