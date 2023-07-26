import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  List<String> products = List.generate(10, (index) => "Ürün ${index + 1}");

  List<String> searchResults = [];
  String selectedProduct = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Eğimli Navigasyon Çubuğu Örneği"),
        ),
        body: _buildPage(),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.blueAccent,
          color: Colors.white,
          buttonBackgroundColor: Colors.blueAccent,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.search, size: 30),
            Icon(Icons.person, size: 30),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
              selectedProduct = "";
            });
          },
        ),
      ),
    );
  }

  Widget _buildPage() {
    switch (_selectedIndex) {
      case 0:
        return _buildHome();
      case 1:
        return _buildSearch();
      case 2:
        return _buildProfile();
      default:
        return Container();
    }
  }

  Widget _buildHome() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            setState(() {
              selectedProduct = products[index];
            });
          },
          child: Card(
            child: Column(
              children: [
                Image.network(
                  "https://via.placeholder.com/150", // Resmin URL'si (örnek olarak placeholder resmi)
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 8),
                Text(
                  products[index],
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSearch() {
    return Column(
      children: [
        TextField(
          onChanged: (value) {
            setState(() {
              searchResults = products
                  .where((product) =>
                  product.toLowerCase().contains(value.toLowerCase()))
                  .toList();
            });
          },
          decoration: InputDecoration(
            hintText: "Arama yapın",
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: searchResults.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(searchResults[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProfile() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Kullanıcı Adı: John Doe"),
          Text("Yaş: 30"),
          Text("Cinsiyet: Erkek"),
        ],
      ),
    );
  }
}
