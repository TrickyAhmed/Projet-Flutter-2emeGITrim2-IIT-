import 'package:flutter/material.dart';
import 'package:personal_cv/main.dart';
import 'package:personal_cv/pages/AcceuilPage.dart';
import 'package:personal_cv/pages/MonRIGPage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LanguagePage(),
  ));
}

class LanguagePage extends StatefulWidget {
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

ThemeData _lightTheme = ThemeData(
  primarySwatch: Colors.amber,
  brightness: Brightness.light,
);

ThemeData _darkTheme = ThemeData(
  primarySwatch: Colors.red,
  brightness: Brightness.dark,
);

class _LanguagePageState extends State<LanguagePage> {
  ThemeData getTheme() {
    return isLightMode ? _lightTheme : _darkTheme;
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getTheme(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(isEnglishOn ? 'Language Information' : 'Informations Linguistiques'),
          backgroundColor: Colors.amberAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isEnglishOn ? 'Preferred Language:' : 'Langue Préférée :',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrangeAccent,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                isEnglishOn ? ' - English' : ' - Anglais',
                style: TextStyle(
                  fontSize: 19.0,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                isEnglishOn ? 'Other Languages:' : 'Autres Langues :',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrangeAccent,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                isEnglishOn ? ' - French\n - Spanish\n - German\n - Chinese' : ' - Français\n - Espagnol\n - Allemand\n - Chinois',
                style: TextStyle(
                  fontSize: 19.0,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
              if (index == 0) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AcceuilPage()));
              } else if (index == 1) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MonRIGPage()));
              }
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}
