import 'package:flutter/material.dart';
import 'package:personal_cv/pages/TemoignagePage.dart';
import 'package:personal_cv/pages/AcceuilPage.dart';
import 'package:personal_cv/pages/PassionsPage.dart';
import 'package:personal_cv/main.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: StagesPage(),
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

class StagesPage extends StatelessWidget {
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
            isEnglishOn ? 'Internships' : 'Stages',
            style: TextStyle(fontSize: 24),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 200.0,
                child: _buildStage(
                  year: '2020',
                  location: isEnglishOn ? ' Primatec Sfax, Tunisia':' Primatec Sfax, Tunisie',
                  duration: isEnglishOn ? ' Duration of 60 Days\n Observer Role .' : ' Durée de 60 Jours\n Role Observateur .',
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 200.0,
                child: _buildStage(
                  year: '2021',
                  location: isEnglishOn ? ' Leipzig, Germany' : ' Leipzig, Allemagne',
                  duration: isEnglishOn ? ' Duration of 30 Days\n Focused on the topic: Internet of Things .' : ' Durée de 30 Jours\n Zoom sur le sujet : Internet des objets.',
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 200.0,
                child: _buildStage(
                  year: '2022',
                  location: isEnglishOn ? ' Chemnitz - Leipzig, Germany' : ' Chemnitz - Leipzig, Allemagne',
                  duration: isEnglishOn ? ' Duration of 90 Days\n Diagnosis and Correction of Errors' : ' Durée de 90 Jours\n Diagnostic et Correction des erreurs ',
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          onTap: (int index) {
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PassionsPage()),
              );
            } else if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AcceuilPage()),
              );
            } else if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TemoignagePage()),
              );
            }
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

  Widget _buildStage({required String year, required String location, required String duration}) {
    return Card(
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: Colors.grey),
      ),
      elevation: 4.0,
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isEnglishOn ? 'Internship $year :' : 'Stage $year :',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 8),
            Text(
              location,
              style: TextStyle(
                fontSize: 19,
              ),
            ),
            SizedBox(height: 8),
            Text(
              duration,
              style: TextStyle(
                fontSize: 19,
                color: getTheme().textTheme.bodyMedium!.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
