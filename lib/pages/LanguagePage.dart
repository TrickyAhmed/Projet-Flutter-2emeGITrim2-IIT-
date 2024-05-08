import 'package:flutter/material.dart';
import 'package:personal_cv/main.dart';
import 'package:personal_cv/pages/AcceuilPage.dart';
import 'package:personal_cv/pages/InformationPage.dart';


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
          backgroundColor: Colors.blueAccent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildCard(
                  title: isEnglishOn ? 'Preferred Language:' : 'Langue Préférée :',
                  content: isEnglishOn ? ' English' : ' Anglais',
                ),
                SizedBox(height: 20.0),
                _buildCard(
                  title: isEnglishOn ? 'Other Languages:' : 'Autres Langues :',
                  content: isEnglishOn ? ' French\n Spanish\n German\n Chinese' : ' Français\n Espagnol\n Allemand\n Chinois',
                ),
              ],
            ),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => InformationPage()));
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

  Widget _buildCard({required String title, required String content}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              content,
              style: TextStyle(
                fontSize: 19.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
