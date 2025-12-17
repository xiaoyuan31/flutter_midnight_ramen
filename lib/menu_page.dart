import 'package:flutter/material.dart';
import 'widgets/menu_item_card.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu')),
      backgroundColor: Colors.teal,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          MenuItemCard(title: 'Tonkotsu Ramen', description: 'Rich pork broth'),
          MenuItemCard(title: 'Miso Ramen', description: 'Savory miso flavor'),
          MenuItemCard(title: 'Shoyu Ramen', description: 'Soy sauce based'),
        ],
      ),
    );
  }
}
