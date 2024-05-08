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
          backgroundColor: Colors.blueAccent,
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 100.0,
                        child: _buildSection(
                          title: isEnglishOn ? 'From year 2006 to 2012 :' : 'De l\'année 2006 vers 2012 ',
                          subtitle: isEnglishOn ? 'Diploma 6th year .' : ' Diplome 6eme année .',
                        ),
                      ),
                      SizedBox(height: 20.0),
                      SizedBox(
                        width: double.infinity,
                        height: 100.0,
                        child: _buildSection(
                          title: isEnglishOn ? 'From year 2012 to 2015 :' : 'De l\'année 2012 vers 2015 ',

                          subtitle: isEnglishOn ? 'Diploma 9th year .' : ' Diplome 9eme année .',
                        ),
                      ),
                      SizedBox(height: 20.0),
                      SizedBox(
                        width: double.infinity,
                        height: 130.0,
                        child: _buildSection(
                          title: isEnglishOn ? 'From year 2015 to 2019 :' : 'De l\'année 2015 vers 2019',
                          subtitle: isEnglishOn ? 'Diploma Baccalaureate Experimental Sciences .' : ' Diplome Baccalauréat Sciences Expérimentales .',
                        ),
                      ),
                      SizedBox(height: 20.0),
                      SizedBox(
                        width: double.infinity,
                        height: 100.0,
                        child: _buildSection(
                          title: isEnglishOn ? 'From year 2019 to 2021 :' : 'De l\'année 2019 vers 2021 ',
                          subtitle: isEnglishOn ? 'National License Diploma .' : ' Diplome National Licence .',
                        ),
                      ),
                      SizedBox(height: 20.0),
                      SizedBox(
                        width: double.infinity,
                        height: 100.0,
                        child: _buildSection(
                          title: isEnglishOn ? 'From year 2022 to 2025 :' : 'De l\'année 2022 vers 2025 : ',
                          subtitle: isEnglishOn ? 'National Engineering Diploma .' : ' Diplome National D\'Ingénieur .',
                        ),
                      ),
                    ],
                  ),
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

  Widget _buildSection({required String title, required String subtitle}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: Colors.grey),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 19.0,
                color: getTheme().textTheme.bodyMedium!.color,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
