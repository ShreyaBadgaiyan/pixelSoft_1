import 'package:flutter/material.dart';


class BrandListPage extends StatelessWidget {
  const BrandListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brands',
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
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
            borderRadius: const BorderRadius.all(Radius.circular(30))

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


