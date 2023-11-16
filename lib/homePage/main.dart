import 'package:flutter/material.dart';
import 'package:flutter_application_4/homePage/config/app_theme.dart';
import 'package:flutter_application_4/homePage/config/background.dart';
import 'package:flutter_application_4/profile_page/profile_page.dart';

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
        body: GradientBackground(child: UserProfilePage()),
      ),
    );
  }
}
