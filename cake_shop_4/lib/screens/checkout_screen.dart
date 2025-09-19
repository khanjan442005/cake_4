
import 'package:flutter/material.dart';
import 'dart:math';
import '../data/app_data.dart';
import 'order_success_screen.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final total = AppState.cart.value.fold(
      0.0,
      (s, e) => s + e.cake.price * e.qty,
    );
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Delivery Address',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).cardColor,
                    ),
                    child: const Text('John Doe\n123, Sample Street\nCity - PIN'),
                  ),
                ],
              ),
            ),
            Text(
              'Total: \u20B9${total.toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity, // Make the button take full width
              child: ElevatedButton(
                onPressed: () {
                  final id = Random().nextInt(900000) + 100000;
                  AppState.cart.value = [];
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => OrderSuccessPage(orderId: id.toString()),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50), // Set a minimum height for the button
                ),
                child: const Text('Place Order'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
