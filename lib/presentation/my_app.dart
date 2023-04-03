import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../data/constants/colors.dart';
import '../domain/app_routes.dart';

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? adaptiveThemeMode;

  MyApp({super.key, this.adaptiveThemeMode});

  late final appRouter = goRouter();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return AdaptiveTheme(
      light: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.mainColor,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      // dark: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(
      //     seedColor: AppColors.mainColor,
      //     brightness: Brightness.dark,
      //   ),
      //   useMaterial3: true,
      // ),
      initial: adaptiveThemeMode ?? AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp.router(
        routerConfig: appRouter,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en'), Locale('ru')],
        debugShowCheckedModeBanner: false,
        title: 'FlyBox',
        theme: theme,
        darkTheme: darkTheme,
      ),
    );
  }
}
