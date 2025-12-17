import 'package:flutter/material.dart';

class MenuItemCard extends StatelessWidget {
  final String title;
  final String description;

  const MenuItemCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 10,
      color: Colors.tealAccent,
      child: ListTile(
        leading: const Icon(Icons.ramen_dining),
        title: Text(title),
        subtitle: Text(description),
      ),
    );
  }
}
