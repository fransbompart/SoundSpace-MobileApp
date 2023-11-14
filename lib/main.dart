import 'package:flutter/material.dart';
import 'package:soundspace_mobileapp/infrastructure/presentation/screens/loginPage/login_page.dart';
import 'package:soundspace_mobileapp/landingPage/Screens/landing_page.dart';

import 'infrastructure/presentation/commons/config/app_theme.dart';
import 'infrastructure/presentation/screens/home/home_page.dart';
import 'infrastructure/repositories/api_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ApiRepository repository = ApiRepository();

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      home: const LandingPage(),
    );
  }
}
