import 'package:flutter/material.dart';
import 'package:helpile/screens/splash_screen.dart';
import 'package:helpile/screens/login_screen.dart';
import 'package:helpile/screens/ask_screen.dart';
import 'package:helpile/screens/register_screen.dart';
import 'package:helpile/screens/professional_register.dart';
import 'package:helpile/screens/home_screen.dart';
import 'package:helpile/screens/profile_page.dart';

class Routes {
  static const String splash = '/';
  static const String ask = '/ask';
  static const String login = '/login';
  static const String register = '/register';
  static const String professional_register = '/professional_register';
  static const String home_screen = '/home_screen';
  static const String profile_page = '/profile_page';
}

final Map<String, WidgetBuilder> routesMap = {
  Routes.splash: (context) => const SplashScreen(),
  Routes.ask: (context) => const AskScreen(),
  Routes.login: (context) => const LoginScreen(),
  Routes.register: (context) => const RegisterScreen(),
  Routes.professional_register: (context) => const Professional_register(),
  Routes.home_screen: (context) => const HomeScreen(),
  Routes.profile_page: (context) => const ProfilePage(),
};
