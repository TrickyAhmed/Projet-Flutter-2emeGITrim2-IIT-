import 'package:flutter/material.dart';
import 'package:personal_cv/main.dart';
import 'package:personal_cv/pages/LanguagePage.dart';
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
          backgroundColor: Colors.blueAccent,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.0),
              _buildCard(
                icon: Icons.email,
                title: isEnglishOn ? 'Email :' : 'E-mail :',
                content: 'ahmedtriki.triki5@gmail.com',
              ),
              _buildCard(
                icon: Icons.phone,
                title: isEnglishOn ? 'Phone :' : 'Téléphone :',
                content: '+27680223',
              ),
              _buildCard(
                icon: Icons.location_on,
                title: isEnglishOn ? 'Address :' : 'Adresse :',
                content: 'RTE Ain, Sfax, Tunisia',
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => LanguagePage()));
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

  Widget _buildCard({required IconData icon, required String title, required String content}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(content),
      ),
    );
  }
}
