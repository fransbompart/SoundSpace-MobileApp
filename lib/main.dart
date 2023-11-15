import 'package:flutter/material.dart';
import 'package:soundspace_mobileapp/infrastructure/presentation/screens/landingPage/Screens/landing_page.dart';

import 'infrastructure/presentation/commons/config/app_theme.dart';

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
      home: const LandingPage(),
    );
  }
}
