import 'package:flutter/material.dart';
import 'package:personal_cv/main.dart';
import 'package:personal_cv/pages/LanguagePage.dart';
import 'package:personal_cv/pages/AcceuilPage.dart';
import 'package:personal_cv/pages/InformationPage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MonRIGPage(),
  ));
}

class MonRIGPage extends StatefulWidget {
  @override
  _MonRIGPageState createState() => _MonRIGPageState();
}

ThemeData _lightTheme = ThemeData(
  primarySwatch: Colors.amber,
  brightness: Brightness.light,
);

ThemeData _darkTheme = ThemeData(
  primarySwatch: Colors.red,
  brightness: Brightness.dark,
);

class _MonRIGPageState extends State<MonRIGPage> {
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
          title: Text(isEnglishOn ? 'PC Specifications' : 'Caractéristiques du PC'),
          backgroundColor: Colors.amberAccent,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isEnglishOn ? 'Processor:' : 'Processeur : ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.deepOrangeAccent,
                ),
              ),
              Text(
                ' - Intel Core i7-10700K',
                style: TextStyle(
                  fontSize: 19,
                ),
              ),
              SizedBox(height: 10),
              Text(
                isEnglishOn ? 'Graphics Card:' : 'Carte graphique : ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.deepOrangeAccent,
                ),
              ),
              Text(
                ' - NVIDIA GeForce RTX 3080',
                style: TextStyle(
                  fontSize: 19,
                ),
              ),
              SizedBox(height: 10),
              Text(
                isEnglishOn ? 'RAM Memory:' : 'Mémoire RAM : ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.deepOrangeAccent,
                ),
              ),
              Text(
                ' - 32 Go DDR4',
                style: TextStyle(
                  fontSize: 19,
                ),
              ),
              SizedBox(height: 10),
              Text(
                isEnglishOn ? 'Storage:' : 'Stockage : ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.deepOrangeAccent,
                ),
              ),
              Text(
                ' - 1 To SSD NVMe + 2 To HDD',
                style: TextStyle(
                  fontSize: 19,
                ),
              ),
              SizedBox(height: 10),
              Text(
                isEnglishOn ? 'Power Supply:' : 'Alimentation : ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.deepOrangeAccent,
                ),
              ),
              Text(
                ' - 750W Gold',
                style: TextStyle(
                  fontSize: 19,
                ),
              ),
              SizedBox(height: 10),
              Text(
                isEnglishOn ? 'Case:' : 'Boîtier : ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.deepOrangeAccent,
                ),
              ),
              Text(
                ' - NZXT H510',
                style: TextStyle(
                  fontSize: 19,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LanguagePage()),
                );
              } else if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AcceuilPage()),
                );
              } else if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InformationPage()),
                );
              }
            });
          },
          items: const [
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
