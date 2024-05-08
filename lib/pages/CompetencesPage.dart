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
          backgroundColor: Colors.blueAccent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildCard(
                  title: isEnglishOn ? 'Development Environments :' : 'Environnements de développement :',
                  content: isEnglishOn ? ' Eclipse \n Intellij \n VS Code' : ' Eclipse \n Intellij \n VS Code',
                ),
                SizedBox(height: 20.0),
                _buildCard(
                  title: isEnglishOn ? 'Frameworks :' : 'Frameworks :',
                  content: isEnglishOn ? ' Laravel\n Node.js\n Angular' : ' Laravel\n Node.js\n Angular',
                ),
                SizedBox(height: 20.0),
                _buildCard(
                  title: isEnglishOn ? 'Programming Languages :' : 'Langages de programmation :',
                  content: isEnglishOn ? ' PHP\n Python.js\n Java' : ' PHP\n Python.js\n Java',
                ),
                SizedBox(height: 20.0),
                _buildCard(
                  title: isEnglishOn ? 'Database Management Systems :' : 'Système de gestion de base de données :',
                  content: isEnglishOn ? ' Microsoft Access\n MySQL\n Oracle Database' : ' Microsoft Access\n MySQL\n Oracle Database',
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

  Widget _buildCard({required String title, required String content}) {
    return Card(

      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: Colors.grey),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0),
            Text(
              content,
              style: TextStyle(
                fontSize: 20.0,
                color: getTheme().textTheme.bodyMedium!.color,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
