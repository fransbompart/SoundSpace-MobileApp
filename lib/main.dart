import 'package:flutter/material.dart';
import 'package:flutter_application_4/config/app_theme.dart';
import 'package:flutter_application_4/config/background.dart';
import 'package:flutter_application_4/presentation/screens/home_page.dart';

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
