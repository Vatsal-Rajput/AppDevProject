import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'CartPage.dart';
import 'selectedItems.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => cartItems())],
      child: MaterialApp(
        title: 'Shopping APP',
        initialRoute: '/',
        routes: {
          '/': (context) => const MainApp(),
          '/second': (context) => CartPage(),
          // Add more routes if needed
        },
      ),
    ),
  );
}

class Product {
  String name;
  int price;
  AssetImage image;
  int id;
  Product(this.name, this.price, this.image, this.id);
}

Product product1 =
    Product('Shoe1', 800, const AssetImage('assets/1636.jpg'), 0);
Product product2 =
    Product('Shoe2', 850, const AssetImage('assets/1637.jpg'), 1);
Product product3 =
    Product('Shoe3', 900, const AssetImage('assets/1653.jpg'), 2);
Product product4 =
    Product('Shoe4', 1800, const AssetImage('assets/1654.jpg'), 3);
Product product5 =
    Product('Shoe5', 600, const AssetImage('assets/1806.jpg'), 4);
Product product6 =
    Product('Shoe6', 800, const AssetImage('assets/1831.jpg'), 5);
Product product7 =
    Product('Shoe7', 750, const AssetImage('assets/1836.jpg'), 6);
Product product8 =
    Product('Shoe8', 500, const AssetImage('assets/2211.jpg'), 7);
Product product9 =
    Product('Shoe9', 2000, const AssetImage('assets/2218.jpg'), 8);
Product product10 =
    Product('Shoe10', 1850, const AssetImage('assets/2219.jpg'), 9);

List<Product> productList = [
  product1,
  product2,
  product3,
  product4,
  product5,
  product6,
  product7,
  product8,
  product9,
  product10
];

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int myindex = 0;
  bool isIconSelected = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Shopping App'),
          ),
          body: Consumer<cartItems>(
            builder: (BuildContext context, cartItems value, Widget? child) {
              return ListView(
                children: [
                  for (Product product in productList)
                    Card(
                      elevation: 2.0, // Adjust the elevation as needed
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: ListTile(
                          title: Text(
                            '${product.name} :Rs ${product.price}',
                            style: const TextStyle(
                              fontSize: 16, // Adjust the font size as needed
                              fontWeight:
                                  FontWeight.bold, // Set the font weight
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          tileColor:
                              Colors.white, // Background color of the ListTile
                          leading: Image(
                            image: product.image,
                            height: 150.0, // Adjust the height as needed
                            width: 120.0, // Take the full width available
                            fit: BoxFit.cover,
                          ),
                          trailing: GestureDetector(
                            onTap: () {
                              context.read<cartItems>().buying(product);
                              context.read<cartItems>().tick(product.id);
                            },
                            child:
                                context.read<cartItems>().selected[product.id]
                                    ? const Icon(
                                        Icons.remove,
                                        size: 30.0,
                                      )
                                    : const Icon(
                                        Icons.add,
                                        size: 30.0,
                                      ),
                          )),
                    )
                ],
              );
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              if (index == 1) {
                Navigator.pushNamed(context, '/second');
              } else {
                Navigator.pushNamed(context, '/');
              }
              setState(() {
                myindex = index;
              });
            },
            currentIndex: myindex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag),
                label: 'Shopping',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: 'Cart'),
            ],
          )),
    );
  }
}
