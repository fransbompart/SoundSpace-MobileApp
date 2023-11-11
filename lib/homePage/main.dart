import 'package:flutter/material.dart';
import 'package:flutter_application_4/homePage/config/app_theme.dart';
import 'package:flutter_application_4/homePage/config/background.dart';
import 'package:flutter_application_4/artist/presentation/screens/artist.dart';
import 'package:flutter_application_4/homePage/presentation/screens/home_page.dart';

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
      home: Scaffold(
        body: GradientBackground(
            child: Artist(
          currentHeight: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top,
          currentWidth: MediaQuery.of(context).size.width,
        )),
      ),
    );
  }
}
