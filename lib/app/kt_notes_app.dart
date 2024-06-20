import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ktnotes/app/theme/app_theme.dart';
import 'package:ktnotes/core/navigation/kt_navigator.dart';
import 'package:ktnotes/ui/page/home/home_screen.dart';

class KtNotesApp extends StatelessWidget {
  const KtNotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
              navigatorKey: KTNavigator.navigationKey,
              debugShowCheckedModeBanner: false,
              title: 'Note',
              // localizationsDelegates: context.localizationDelegates,
              // supportedLocales: context.supportedLocales,
              // locale: context.locale,
              // themeMode: settingsController.themeMode.value.toThemeMode,
              themeMode: ThemeMode.dark,
              theme: AppTheme.light(null),
              // darkTheme: AppTheme.custom(),
              home: const HomeScreen(),
              builder: (ctx, child) {
                final systemOverlay = Theme.of(ctx).brightness == Brightness.light
                    ? SystemUiOverlayStyle.dark.copyWith(
                        statusBarColor: Colors.transparent,
                        systemNavigationBarColor: Colors.transparent)
                    : SystemUiOverlayStyle.light.copyWith(
                        statusBarColor: Colors.transparent,
                        systemNavigationBarColor: Colors.transparent);
                return AnnotatedRegion<SystemUiOverlayStyle>(
                    value: systemOverlay, child: child!);
              },
            );
  }
}