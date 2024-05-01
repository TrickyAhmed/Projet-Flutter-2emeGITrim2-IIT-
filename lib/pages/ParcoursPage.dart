import 'package:flutter/material.dart';
import 'package:personal_cv/main.dart';
import 'package:personal_cv/pages/AcceuilPage.dart';
import 'package:personal_cv/pages/CompetencesPage.dart';
import 'package:personal_cv/pages/PassionsPage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ParcoursPage(),
  ));
}

ThemeData _lightTheme = ThemeData(
  primarySwatch: Colors.amber,
  brightness: Brightness.light,
);

ThemeData _darkTheme = ThemeData(
  primarySwatch: Colors.red,
  brightness: Brightness.dark,
);

class ParcoursPage extends StatefulWidget {
  @override
  _ParcoursPageState createState() => _ParcoursPageState();
}

class _ParcoursPageState extends State<ParcoursPage> {
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
          title: Text(
            isEnglishOn ? 'Career' : 'Parcours',
          ),
          backgroundColor: Colors.greenAccent,
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.0),
              Text(
                isEnglishOn
                    ? 'From year 2006 -> 2012: Primary School El Jalouli Sfax:'
                    : 'De l\'année 2006 -> 2012 : Ecole primaire El Jalouli Sfax : ',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                isEnglishOn ? '- Diploma 6th year .' : ' - Diplome 6eme année .',
                style: TextStyle(
                  fontSize: 19.0,
                  color: getTheme().textTheme.bodyMedium!.color,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                isEnglishOn
                    ? 'From year 2012 -> 2015: Mostfa Sellemi College Sfax:'
                    : 'De l\'année 2012 -> 2015 : Collége Mostfa Sellemi Sfax : ',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                isEnglishOn ? '- Diploma 9th year .' : ' - Diplome 9eme année .',
                style: TextStyle(
                  fontSize: 19.0,
                  color: getTheme().textTheme.bodyMedium!.color,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                isEnglishOn
                    ? 'From year 2015 -> 2019: 15 November 1955 High School Sfax:'
                    : 'De l\'année 2015 -> 2019 : Lycée 15 novembre 1955 Sfax : ',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                isEnglishOn ? '- Diploma Baccalaureate Experimental Sciences .' : ' -  Diplome Baccalauréat Sciences Expérimentales .',
                style: TextStyle(
                  fontSize: 19.0,
                  color: getTheme().textTheme.bodyMedium!.color,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                isEnglishOn
                    ? 'From year 2019 -> 2021: Bachelor in Computer Science BI A Espin Sfax:'
                    : 'De l\'année 2019 -> 2021 : Licence en informatique BI A Espin Sfax : ',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                isEnglishOn ? '- National License Diploma .' : ' - Diplome National Licence .',
                style: TextStyle(
                  fontSize: 19.0,
                  color: getTheme().textTheme.bodyMedium!.color,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                isEnglishOn
                    ? 'From year 2022 -> 2025: Engineering Cycle At iit Sfax:'
                    : 'De l\'année 2022 -> 2025 : Cycle Ingénieur A l\'iit Sfax :',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                isEnglishOn ? '- National Engineering Diploma .' : ' - Diplome National D\'Ingénieur .',
                style: TextStyle(
                  fontSize: 19.0,
                  color: getTheme().textTheme.bodyMedium!.color,
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
              if (_currentIndex == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CompetencesPage()),
                );
              } else if (_currentIndex == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AcceuilPage()),
                );
              } else if (_currentIndex == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PassionsPage()),
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
}
