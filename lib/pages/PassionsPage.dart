import 'package:flutter/material.dart';
import 'package:personal_cv/pages/AcceuilPage.dart';
import 'package:personal_cv/pages/StagesPage.dart';
import 'package:personal_cv/pages/ParcoursPage.dart';
import 'package:personal_cv/main.dart';

class PassionsPage extends StatefulWidget {
  @override
  _PassionsPageState createState() => _PassionsPageState();
}

ThemeData _lightTheme = ThemeData(
  primarySwatch: Colors.amber,
  brightness: Brightness.light,
);

ThemeData _darkTheme = ThemeData(
  primarySwatch: Colors.red,
  brightness: Brightness.dark,
);

class _PassionsPageState extends State<PassionsPage> {
  int _currentIndex = 0;

  ThemeData getTheme() {
    return isLightMode ? _lightTheme : _darkTheme;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getTheme(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            isEnglishOn ? 'Passions' : 'Passions',
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            _buildSection(
              title: isEnglishOn ? 'Passions' : 'Passions',
              items: [
                isEnglishOn ? 'Great Reader - Read over 500 books' : 'Grand Lecteur - Lu plus de 500 livres',
                isEnglishOn ? 'Mind Games - Keywords - Crosswords' : 'Jeux d\'esprit - Les mots clés - Les mots croisées',
                isEnglishOn ? 'Mobile Programming - Android Applications' : 'Programmation mobile - Applications android',
              ],
            ),
            _buildSection(
              title: isEnglishOn ? 'Sports' : 'Sports',
              items: [
                !isEnglishOn ? 'Le Football' : 'Football',
                !isEnglishOn ? 'Le Rugby' : 'Rugby',
                !isEnglishOn ? 'Le Tennis' : 'Tennis',
              ],
            ),
            _buildSection(
              title: isEnglishOn ? 'Qualities' : 'Qualités',
              items: [
                !isEnglishOn ? 'Humble' : 'Smart',
                !isEnglishOn ? 'Généreux' : 'Kind',
                !isEnglishOn ? 'Doux' : 'Aweasome',
              ],
            ),
            SizedBox(height: 20.0),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
              if (_currentIndex == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ParcoursPage()),
                );
              } else if (_currentIndex == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AcceuilPage()),
                );
              } else if (_currentIndex == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StagesPage()),
                );
              }
            });
          },
          items: [
            BottomNavigationBarItem(
              label: '',
              icon: Icon(Icons.arrow_back_ios),
            ),
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

  Widget _buildSection({required String title, List<String> items = const []}) {
    return ExpansionTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple,
        ),
      ),
      children: items.map((item) {
        return ListTile(
          title: Text(
            item,
            style: TextStyle(fontSize: 19.0),
          ),
        );
      }).toList(),
    );
  }

}
