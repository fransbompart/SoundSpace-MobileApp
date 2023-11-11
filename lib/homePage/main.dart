import 'package:flutter/material.dart';
import 'package:flutter_application_4/homePage/config/app_theme.dart';
import 'package:flutter_application_4/homePage/config/background.dart';
import 'package:flutter_application_4/homePage/presentation/screens/home_page.dart';
import 'package:flutter_application_4/landingPage/Screens/landing_page.dart';
import 'package:flutter_application_4/loginInvitado/presentation/screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      routes: {
        '/homepage': (context) => const HomePage(),
        '/login': (context) => const LoginState(),
      },
      home: const LandingPage(),
      
      
    );
  }
}
