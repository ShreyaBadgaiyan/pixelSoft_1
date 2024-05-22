import 'package:flutter/material.dart';
import 'package:pixelsoft2/screens/brand_list_page.dart';
import 'package:pixelsoft2/screens/profile_page.dart';
import 'package:pixelsoft2/screens/analytics_page.dart';
import 'package:pixelsoft2/screens/link_lo_page.dart';
import 'package:pixelsoft2/screens/link_genie_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brand List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 4;

  static final List<Widget> _widgetOptions = <Widget>[

    BrandListPage(),
    LinkGeniePage(),
    LinkLoPage(),
    AnalyticsPage(),
    ProfilePage(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.store,
            ),
            label: 'Brands',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.link,

            ),
            label: 'Link Genie',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.link_off,

            ),
            label: 'Link-Lo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics,

            ),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
       // selectedItemColor: Colors.amber[800],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        // unselectedLabelStyle: TextStyle(
        //   color: Colors.grey
        // ),
        showUnselectedLabels: true,
      ),
    );
  }
}
