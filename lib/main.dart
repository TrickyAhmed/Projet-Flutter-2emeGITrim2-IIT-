import 'package:flutter/material.dart';
import 'package:personal_cv/pages/TemoignagePage.dart';
import 'package:personal_cv/pages/StagesPage.dart';
import 'package:personal_cv/pages/PassionsPage.dart';
import 'package:personal_cv/pages/ParcoursPage.dart';
import 'package:personal_cv/pages/CompetencesPage.dart';
import 'package:personal_cv/pages/AcceuilPage.dart';
import 'package:personal_cv/pages/InformationPage.dart';
import 'package:personal_cv/pages/MonRIGPage.dart';
import 'package:personal_cv/pages/LanguagePage.dart';
import 'package:personal_cv/pages/MapPage.dart';
bool isLightMode = true;
bool isEnglishOn = true;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routes = {
      '/LanguagePage': (context) => LanguagePage(),
      '/MonRIGPage': (context) => MonRIGPage(),
      '/informations': (context) => InformationPage(),
      '/competences': (context) => CompetencesPage(),
      '/acceuil': (context) => AcceuilPage(),
      '/parcours': (context) => ParcoursPage(),
      '/passions': (context) => PassionsPage(),
      '/stages': (context) => StagesPage(),
      '/temoignage': (context) => TemoignagePage(),
      '/maps': (context) => MapPage(),
    };

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: AcceuilPage(),
    );
  }
}
