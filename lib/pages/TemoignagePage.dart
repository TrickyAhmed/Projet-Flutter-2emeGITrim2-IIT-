import 'package:flutter/material.dart';
import 'package:personal_cv/pages/AcceuilPage.dart';
import 'package:personal_cv/pages/StagesPage.dart';
import 'package:personal_cv/main.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TemoignagePage(),
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

class TemoignagePage extends StatefulWidget {
  @override
  _TemoignagePageState createState() => _TemoignagePageState();
}

class _TemoignagePageState extends State<TemoignagePage> {
  ThemeData getTheme() {
    return isLightMode ? _lightTheme : _darkTheme;
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getTheme(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(isEnglishOn ? 'Testimonials' : 'Témoignages' , style: TextStyle(fontSize: 24),),
            backgroundColor: Colors.blueAccent

        ),
        body: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('images/IIT.png'),
                radius: 50.0,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text(
                      'IIT : ',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    subtitle: Text(
                      isEnglishOn
                          ? "The IIT pays particular attention to scientific research, especially in the fields of renewable energy, environment, computer security, 3D printing, information and communication technology (ICT). It has created a research, development, and creativity center, as well as a Fabrication Laboratory (FABLAB). The Institute also has an incubator that facilitates and encourages young graduates to launch their startups in a competitive environment. I love IIT and I wish all my friends come to study here."
                          : "L’IIT accorde une attention particulière à la recherche scientifique notamment dans le domaine des énergies renouvelables, de l’environnement, de la sécurité informatique, d’impression 3D, de l’information et de la communication (TIC). Elle a créé un centre de recherche, de développement et de créativité, ainsi qu’un laboratoire de Fabrication (FABLAB), L’Institut est aussi doté d’une pépinière qui facilite et encourage les jeunes diplômés à lancer leurs start-ups dans un environnement compétitif. J'aime bien l'iit et je souhaite que tous mes amis viennent faire leurs études ici.",
                      style: TextStyle(
                        color: getTheme().textTheme.bodyMedium!.color,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
              if (_currentIndex == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StagesPage()),
                );
              } else if (_currentIndex == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AcceuilPage()),
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
          ],
        ),
      ),
    );
  }
}
