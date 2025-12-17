import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<StatefulWidget> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final noteController = TextEditingController();
  final phoneController = TextEditingController();

  final List<int> quantities = [1, 2, 3, 4];
  int selectedQuantity = 1;

  @override
  void dispose() {
    nameController.dispose();
    noteController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void submitOrder() {
    if (_formKey.currentState!.validate()) {
      String name = nameController.text;
      String phone = phoneController.text;
      String note = noteController.text;
      int quantity = selectedQuantity;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Order Submitted!\nName: $name\nPhone: $phone\nQuantity: $quantity\nNote: $note',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Place Order")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Customer Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your name";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your phone";
                  }
                  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return 'Only numbers are allowed';
                  }
                  // Optional: check length (e.g., at least 8 digits)
                  if (value.length < 8) {
                    return 'Phone number must be at least 8 digits';
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<int>(
                initialValue: selectedQuantity,
                decoration: const InputDecoration(
                  labelText: 'Quantity',
                  border: OutlineInputBorder(),
                ),
                items: quantities
                    .map(
                      (q) =>
                          DropdownMenuItem(value: q, child: Text(q.toString())),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedQuantity = value ?? 1;
                  });
                },
              ),

              const SizedBox(height: 16),
              TextFormField(
                controller: noteController,
                decoration: const InputDecoration(
                  labelText: 'Order Notes',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: submitOrder,
                child: const Text("Submit Order"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
