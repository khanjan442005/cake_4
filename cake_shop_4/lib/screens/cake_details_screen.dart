
import 'package:flutter/material.dart';
import 'dart:math';
import '../data/app_data.dart';
import 'cart_screen.dart';

class CakeDetailsPage extends StatefulWidget {
  final Cake cake;
  const CakeDetailsPage({super.key, required this.cake});
  @override
  State<CakeDetailsPage> createState() => _CakeDetailsPageState();
}

class _CakeDetailsPageState extends State<CakeDetailsPage> {
  int qty = 1;
  @override
  Widget build(BuildContext context) {
    final c = widget.cake;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(c.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                c.image,
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  c.name,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\u20B9${c.price.toStringAsFixed(0)}',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(c.desc),
            const SizedBox(height: 12),
            Row(
              children: [
                const Text('Quantity', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 12),
                quantitySelector(),
              ],
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    addToCartAndMaybeCheckout(false);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50), // Make button full width
                  ),
                  child: const Text('Add to Cart'),
                ),
                const SizedBox(height: 12), // Add some vertical spacing
                ElevatedButton(
                  onPressed: () {
                    addToCartAndMaybeCheckout(true);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50), // Make button full width
                  ),
                  child: const Text('Buy Now'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget quantitySelector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).cardColor,
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => setState(() => qty = max(1, qty - 1)),
            icon: const Icon(Icons.remove),
          ),
          Text(
            '$qty',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          IconButton(
            onPressed: () => setState(() => qty = qty + 1),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  void addToCartAndMaybeCheckout(bool buyNow) {
    final list = List<CartItem>.from(AppState.cart.value);
    final existing = list.indexWhere((e) => e.cake.id == widget.cake.id);
    if (existing >= 0) {
      list[existing].qty += qty;
    } else {
      list.add(CartItem(cake: widget.cake, qty: qty));
    }
    AppState.cart.value = list;
    if (buyNow) {
      if (!context.mounted) return;
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (_) => const CartPage(autoCheckout: true)));
    } else {
      Navigator.of(context).pop();
    }
  }
}
