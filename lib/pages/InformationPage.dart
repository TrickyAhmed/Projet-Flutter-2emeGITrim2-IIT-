import 'package:flutter/material.dart';
import 'package:personal_cv/main.dart';
import 'package:personal_cv/pages/MonRIGPage.dart';
import 'package:personal_cv/pages/AcceuilPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InformationPage(),
    );
  }
}

class InformationPage extends StatefulWidget {
  @override
  _InformationPageState createState() => _InformationPageState();
}

ThemeData _lightTheme = ThemeData(
  primarySwatch: Colors.amber,
  brightness: Brightness.light,
);

ThemeData _darkTheme = ThemeData(
  primarySwatch: Colors.red,
  brightness: Brightness.dark,
);

class _InformationPageState extends State<InformationPage> {
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
          title: Text(isEnglishOn ? 'Contact Information' : 'Informations de Contact'),
          backgroundColor: Colors.amberAccent,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isEnglishOn ? 'Contact Information:' : 'Informations de Contact :',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrangeAccent,
                ),
              ),
              SizedBox(height: 10.0),
              ListTile(
                leading: Icon(Icons.email),
                title: Text(isEnglishOn ? 'Email : ahmedtriki.triki5@gmail.com' : 'E-mail : ahmedtriki.triki5@gmail.com'),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text(isEnglishOn ? 'Phone : +27680223' : 'Téléphone : +27680223'),
              ),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text(isEnglishOn ? 'Address : RTE Ain, Sfax, Tunisia' : 'Adresse : RTE Ain , Sfax , Tunisie'),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => MonRIGPage()));
              } else if (_currentIndex == 1) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AcceuilPage()));
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
          ],
        ),
      ),
    );
  }
}
