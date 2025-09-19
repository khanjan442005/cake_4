
import 'package:flutter/material.dart';
import '../data/app_data.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Wishlist'),
      ),
      body: ValueListenableBuilder<Set<int>>(
        valueListenable: AppState.wishlist,
        builder: (context, set, _) {
          final list = sampleCakes.where((c) => set.contains(c.id)).toList();
          if (list.isEmpty) {
            return const Center(
              child: Text('No favourites yet. Tap ❤️ to save cakes.'),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: list.length,
            itemBuilder: (context, i) {
              final c = list[i];
              return ListTile(
                leading: Image.asset(
                  c.image,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
                title: Text(c.name),
                subtitle: Text(' \u20B9${c.price.toStringAsFixed(0)}'),
                trailing: IconButton(
                  icon: const Icon(Icons.add_shopping_cart),
                  onPressed: () {
                    addToCart(c);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${c.name} added to cart!')),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  void addToCart(Cake c) {
    final list = List<CartItem>.from(AppState.cart.value);
    final existing = list.indexWhere((e) => e.cake.id == c.id);
    if (existing >= 0) {
      list[existing].qty += 1;
    } else {
      list.add(CartItem(cake: c, qty: 1));
    }
    AppState.cart.value = list;
  }
}
