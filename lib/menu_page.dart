import 'package:flutter/material.dart';
import 'package:flutter_midnight_ramen/order_page.dart';
import 'widgets/menu_item_card.dart';
import 'models/menu_item.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final List<MenuItem> orderItems = [];

  final List<MenuItem> menuItems = [
    MenuItem(
      name: 'Tonkotsu Ramen',
      description: 'Rich pork broth',
      price: 12.5,
      image: 'assets/images/tonkotsu.jpg',
    ),
    MenuItem(
      name: 'Miso Ramen',
      description: 'Savory miso flavor',
      price: 11.0,
      image: 'assets/images/miso.jpg',
    ),
    MenuItem(
      name: 'Shoyu Ramen',
      description: 'Soy sauce based',
      price: 10.0,
      image: 'assets/images/shoyu.jpg',
    ),
  ];

  double get total =>
      orderItems.fold(0, (previous, item) => previous + item.price);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Midnight Ramen 🍜'),
        backgroundColor: Colors.deepOrange,
      ),
      backgroundColor: Colors.orange.shade50,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                final item = menuItems[index];
                return MenuItemCard(
                  item: item,
                  onAdd: () {
                    setState(() {
                      orderItems.add(item);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${item.name} added to order')),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                if (orderItems.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('No items in order!')),
                  );
                  return;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderPage(
                      prefilledItems: orderItems,
                      totalPrice: total,
                    ),
                  ),
                );
              },
              child: Text('Proceed to Order (\$${total.toStringAsFixed(2)})'),
            ),
          ),
        ],
      ),
    );
  }
}
