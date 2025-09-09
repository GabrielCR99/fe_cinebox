import 'package:flutter/material.dart';
import 'ui/core/themes/theme.dart';
import 'ui/home/home_screen.dart';
import 'ui/login/login_screen.dart';
import 'ui/splash/splash_screen.dart';

final class CineboxMainApp extends StatelessWidget {
  const CineboxMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinebox',
      theme: AppTheme.theme,
      routes: {
        '/': (_) => const SplashScreen(),
        '/login': (_) => const LoginScreen(),
        '/home': (_) => const HomeScreen(),
      },
    );
  }
}
