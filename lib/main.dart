import 'package:flutter/material.dart';
import 'package:soundspace_mobileapp/homePage/config/background.dart';
import 'package:soundspace_mobileapp/homePage/presentation/screens/home_page.dart';
import 'homePage/config/app_theme.dart';

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
      home: const Scaffold(
        body: GradientBackground(child: HomePage()),
      ),
    );
  }
}
