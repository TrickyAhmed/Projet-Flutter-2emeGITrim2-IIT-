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
          backgroundColor: Colors.greenAccent,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isEnglishOn ? 'Internship 2020 :' : 'Stage 2020 :',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    ' - Primatec - Sfax, Tunisie .',
                    style: TextStyle(
                      fontSize: 19,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    isEnglishOn ? ' - Duration of 60 Days\n - Observer Role .' : ' - Durée de 60 Jours\n - Role Observateur .',
                    style: TextStyle(
                      fontSize: 19,
                    ),
                  ),

                ],
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isEnglishOn ? 'Internship 2021 :' : 'Stage 2021 :',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    ' - HTWK - Leipzig, Allemagne .',
                    style: TextStyle(
                      fontSize: 19,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    isEnglishOn ? ' - Duration of 30 Days\n - Focused on the topic: Internet of Things .' : ' - Durée de 30 Jours\n - Zoom sur le sujet : Internet des objets .',
                    style: TextStyle(
                      fontSize: 19,
                    ),
                  ),

                ],
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isEnglishOn ? 'Internship 2022 :' : 'Stage 2022 :',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    ' - Chemnitz - Leipzig, Allemagne .',
                    style: TextStyle(
                      fontSize: 19,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    isEnglishOn ? ' - Duration of 90 Days\n - Diagnosis and Correction of Errors' : ' - Durée de 90 Jours\n - Diagnostic et Correction des erreurs ',
                    style: TextStyle(
                      fontSize: 19,
                    ),
                  ),

                ],
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
}
