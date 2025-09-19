
import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: 3, // Dummy data
        itemBuilder: (context, i) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order #${i + 1}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text('Date: 2024-01-01'),
                  const SizedBox(height: 4),
                  const Text('Total: \u20B91500'),
                  const SizedBox(height: 4),
                  const Text('Status: Delivered'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
