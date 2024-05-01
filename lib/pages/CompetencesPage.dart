import 'package:flutter/material.dart';
import 'package:personal_cv/main.dart';
import 'package:personal_cv/pages/AcceuilPage.dart';
import 'package:personal_cv/pages/ParcoursPage.dart';

class CompetencesPage extends StatefulWidget {
  @override
  _CompetencesPageState createState() => _CompetencesPageState();
}

ThemeData _lightTheme = ThemeData(
  primarySwatch: Colors.amber,
  brightness: Brightness.light,
);

ThemeData _darkTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.dark,
);

class _CompetencesPageState extends State<CompetencesPage> {
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
          title: Text(isEnglishOn ? 'Computer Skills' : 'Compétences en informatique'),
          backgroundColor: Colors.greenAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isEnglishOn ? 'Development Environments :' : 'Environnements de développement :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.0),
              Text(
                isEnglishOn ? ' - Eclipse \n - Intellij \n - VS Code' : ' - Eclipse \n - Intellij \n - VS Code',
                style: TextStyle(
                  fontSize: 20.0,
                  color: getTheme().textTheme.bodyMedium!.color,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 20.0),
              Text(
                isEnglishOn ? 'Frameworks :' : 'Frameworks :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 10.0),
              Text(
                isEnglishOn ? ' - Laravel\n - Node.js\n - Angular' : ' - Laravel\n - Node.js\n - Angular',
                style: TextStyle(
                  fontSize: 20.0,
                  color: getTheme().textTheme.bodyMedium!.color,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 20.0),
              Text(
                isEnglishOn ? 'Programming Languages :' : 'Langages de programmation :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 10.0),
              Text(
                isEnglishOn ? ' - PHP\n - Python.js\n - Java' : ' - PHP\n - Python.js\n - Java',
                style: TextStyle(
                  fontSize: 20.0,
                  color: getTheme().textTheme.bodyMedium!.color,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 20.0),
              Text(
                isEnglishOn ? 'Database Management Systems :' : 'Système de gestion de base de données :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                  fontSize: 20.0,
                  fontFamily: 'Roboto',
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 10.0),
              Text(
                isEnglishOn ? ' - Microsoft Access\n - MySQL\n - Oracle Database' : ' - Microsoft Access\n - MySQL\n - Oracle Database',
                style: TextStyle(
                  fontSize: 20.0,
                  color: getTheme().textTheme.bodyMedium!.color,
                ),
                textAlign: TextAlign.start,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AcceuilPage()),
                );
              } else if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ParcoursPage()),
                );
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
