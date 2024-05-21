import 'package:flutter/material.dart';
import 'package:pixelsoft2/screen_five.dart';
import 'package:pixelsoft2/screen_four.dart';
import 'package:pixelsoft2/screen_three.dart';
import 'package:pixelsoft2/screen_two.dart';
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
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    BrandListPage(),
    ScreenTwo(),
    ScreenThree(),
    ScreenFour(),
    ScreenFive(),
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

class BrandListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brands',
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Search for Brands, Products, icons...',
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildBrandTile('Myntra', 'assets/logo/meesho.png', 'Commission: 12%'),
                _buildBrandTile('Meesho', 'assets/logo/myntra.png', 'Catalog: 12%\nNon-Catalog: 1%'),
                _buildBrandTile('Nykaa Fashion', 'assets/logo/nykaa.png', 'Commission: 8%'),
                _buildBrandTile('Nykaa Beauty', 'assets/logo/nykaa.png', 'Commission: 8%'),
                _buildBrandTile('Ajio', 'assets/logo/meesho.png', 'Commission: 8%'),
                _buildBrandTile('Ketch', 'assets/logo/meesho.png', 'Commission: 12%'),
                _buildBrandTile('Shoppers Stop', 'assets/logo/meesho.png', 'Commission: 20%'),
                _buildBrandTile('Foxtale', 'assets/logo/meesho.png', 'Commission: 20%'),
                _buildBrandTile('Rigo', 'assets/logo/meesho.png', 'Commission: 20%'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBrandTile(String name, String imagePath, String commission) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        backgroundImage: AssetImage(
          imagePath,),
      ),
      title: Text(name),
      trailing: Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.all(Radius.circular(30))

          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Text(commission),

            ),
          ),
    );
  }
}

class LinkGeniePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Link Genie Page'),
      ),
    );
  }
}

class LinkLoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Link-Lo Page'),
      ),
    );
  }
}

class AnalyticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Analytics Page'),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Profile Page'),
      ),
    );
  }
}