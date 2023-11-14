import 'package:flutter/material.dart';
import 'commons/config/app_theme.dart';
import 'commons/config/background.dart';
import 'screens/home/home_page.dart';

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
