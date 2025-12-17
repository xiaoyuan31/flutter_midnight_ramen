import 'package:flutter/material.dart';
import '../models/menu_item.dart';

class MenuItemCard extends StatelessWidget {
  final MenuItem item;
  final VoidCallback? onAdd;

  const MenuItemCard({super.key, required this.item, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 10,
      color: Colors.orangeAccent,
      child: ListTile(
        leading: Image.asset(
          item.image,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(item.name),
        subtitle: Text(
          '${item.description} - \$${item.price.toStringAsFixed(2)}',
        ),
        trailing: ElevatedButton(onPressed: onAdd, child: const Text("Add")),
      ),
    );
  }
}
