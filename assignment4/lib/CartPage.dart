import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'selectedItems.dart';
import 'main.dart';

class CartPage extends StatefulWidget {
  CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int myindex = 1;

  @override
  Widget build(BuildContext context) {
    final addeditems = Provider.of<cartItems>(context);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cart Page'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: addeditems.products.length,
                itemBuilder: (context, index) {
                  Product product = addeditems.products[index];
                  return Card(
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      title: Text(
                        '${product.name} :Rs ${product.price}',
                        style: const TextStyle(
                          fontSize: 16, // Adjust the font size as needed
                          fontWeight: FontWeight.bold, // Set the font weight
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      tileColor: Colors.white,
                      leading: Image(
                        image: product.image,
                        height: 150.0,
                        width: 120.0,
                        fit: BoxFit.cover,
                      ),
                      trailing: GestureDetector(
                        onTap: () {
                          context.read<cartItems>().buying(product);
                          context.read<cartItems>().tick(product.id);
                        },
                        child: context.read<cartItems>().selected[product.id]
                            ? const Icon(
                                Icons.remove,
                                size: 30.0,
                              )
                            : const Icon(
                                Icons.add,
                                size: 30.0,
                              ),
                      ),
                    ),
                  );
                },
              ),
            ),
            TextButton(
              onPressed: () {
                addeditems.empty();
              },
              child: Text('BUY Rs${addeditems.sum}'),
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Color.fromARGB(255, 72, 238, 77),
                ),
                fixedSize: MaterialStatePropertyAll(Size(400, 30)),
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            if (index == 1)
              Navigator.pushNamed(context, '/second');
            else {
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
        ),
      ),
    );
  }
}
