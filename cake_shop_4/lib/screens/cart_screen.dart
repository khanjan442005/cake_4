
import 'package:flutter/material.dart';
import '../data/app_data.dart';
import 'checkout_screen.dart';

class CartPage extends StatefulWidget {
  final bool autoCheckout;
  const CartPage({super.key, required this.autoCheckout});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  @override
  void initState() {
    super.initState();
    if (widget.autoCheckout) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const CheckoutPage()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Cart'),
      ),
      body: ValueListenableBuilder<List<CartItem>>(
        valueListenable: AppState.cart,
        builder: (context, list, _) {
          if (list.isEmpty) {
            return const Center(
              child: Text('Your cart is empty. Add some cakes!'),
            );
          }
          final total = list.fold(0.0, (s, e) => s + e.cake.price * e.qty);
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: list.length,
                  itemBuilder: (context, i) {
                    final item = list[i];
                    return ListTile(
                      leading: Image.asset(
                        item.cake.image,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      title: Text(item.cake.name),
                      subtitle: Text('Qty: ${item.qty}'),
                      trailing: Text(
                        '\u20B9${(item.cake.price * item.qty).toStringAsFixed(0)}',
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total: \u20B9${total.toStringAsFixed(0)}',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const CheckoutPage()),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: const Text('Checkout'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
