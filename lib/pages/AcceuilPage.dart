import 'package:flutter/material.dart';
import 'package:personal_cv/main.dart';
import 'package:personal_cv/pages/CompetencesPage.dart';
import 'package:personal_cv/pages/MapPage.dart';
import 'package:personal_cv/pages/ParcoursPage.dart';
import 'package:personal_cv/pages/PassionsPage.dart';
import 'package:personal_cv/pages/StagesPage.dart';
import 'package:personal_cv/pages/TemoignagePage.dart';
import 'package:personal_cv/pages/InformationPage.dart';
import 'package:personal_cv/pages/LanguagePage.dart';
import 'package:language_picker/languages.dart';
import 'package:language_picker/language_picker.dart';

void main() {
  runApp(AcceuilPage());
}

bool _iconbool = true;
IconData _iconLight = Icons.wb_sunny;
IconData _iconDark = Icons.nights_stay;
ThemeData _lighTheme = ThemeData(
  primarySwatch: Colors.amber,
  brightness: Brightness.light,
);

ThemeData _darkTheme = ThemeData(
  primarySwatch: Colors.red,
  brightness: Brightness.dark,
);

class AcceuilPage extends StatefulWidget {
  @override
  _AcceuilPageState createState() => _AcceuilPageState();
}

class _AcceuilPageState extends State<AcceuilPage> {
  int _currentIndex = 0;


  ThemeData getTheme() {
    return isLightMode ? _lighTheme : _darkTheme;
  }

  void _openLanguagePickerDialog() {
    setState(() {
      isEnglishOn = !isEnglishOn;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getTheme(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(isEnglishOn ? 'Welcome' : 'Bienvenue'),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  _iconbool = !_iconbool;
                  isLightMode = !isLightMode;
                });
              },
              icon: Icon(_iconbool ? Icons.nights_stay : Icons.wb_sunny),
            ),
            IconButton(
              onPressed: () {
                _openLanguagePickerDialog();
              },
              icon: Icon(Icons.language_outlined),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green[100],
                ),
                child: Center(
                  child: CircleAvatar(
                    // Use the user's image here
                    backgroundImage: AssetImage('images/Traveling.jpg'),
                    radius: 80,
                  ),
                ),
              ),
              ListTile(
                title: Text(isEnglishOn ? 'Languages +' : 'Langues +'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LanguagePage()),
                  );
                },
              ),

              ListTile(
                title: Text(isEnglishOn ? 'Information Page' : 'Informations Page'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InformationPage()),
                  );
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/Me.jpg'),
                    radius: 50.0,
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  isEnglishOn ? 'Hello, I am Ahmed Triki' : 'Bonjour, Je suis Ahmed Triki',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                Text(
                  isEnglishOn
                      ? 'Software Developer | Future Mobile App Developer'
                      : "Développeur de logiciels | Futur développeur d'applications mobiles",
                  style: TextStyle(fontSize: 18.0),
                ),
                SizedBox(height: 20.0),
                Text(
                  isEnglishOn ? 'Specialty:' : 'Spécialité:',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                Wrap(
                  spacing: 8.0,
                  children: [
                    Chip(label: Text('Java OO', style: TextStyle(color: Colors.blue))),
                    Chip(label: Text('Dart', style: TextStyle(color: Colors.orange))),
                    Chip(label: Text('Firebase', style: TextStyle(color: Colors.deepPurple))),
                    Chip(label: Text('UI/UX Design', style: TextStyle(color: Colors.green))),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  isEnglishOn ? ' My company on maps:' : 'Ma société sur la carte :',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 50.0),
                Center(
                  child: SizedBox(
                    width: 200, // Adjust the width as needed
                    height: 100, // Adjust the height as needed
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MapPage()),
                        );
                      },
                      icon: Icon(Icons.map),
                      label: Text(isEnglishOn ? 'My Company' : 'Ma Société'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ),




              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
              switch (newIndex) {
                case 0:
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AcceuilPage()));
                  break;
                case 1:
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CompetencesPage()));
                  break;
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
