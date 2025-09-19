
import 'package:flutter/material.dart';
import 'dart:math';
import '../data/app_data.dart';
import '../screens/cart_screen.dart';

class CakeCard extends StatefulWidget {
  final Cake cake;
  final VoidCallback onTap;
  const CakeCard({super.key, required this.cake, required this.onTap});

  @override
  State<CakeCard> createState() => _CakeCardState();
}

class _CakeCardState extends State<CakeCard> {
  int qty = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).cardColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                widget.cake.image,
                height: 110,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.cake.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      ValueListenableBuilder<Set<int>>(
                        valueListenable: AppState.wishlist,
                        builder: (context, set, _) {
                          final liked = set.contains(widget.cake.id);
                          return GestureDetector(
                            onTap: () {
                              final s = Set<int>.from(AppState.wishlist.value);
                              if (liked) {
                                s.remove(widget.cake.id);
                              } else {
                                s.add(widget.cake.id);
                              }
                              AppState.wishlist.value = s;
                            },
                            child: Icon(
                              liked ? Icons.favorite : Icons.favorite_border,
                              color: liked ? Colors.red : null,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\u20B9${widget.cake.price.toStringAsFixed(0)}',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      quantitySelector(),
                      Expanded( // Wrap the inner Row in Expanded
                        child: Row(
                          children: [
                            Expanded( // Make "Add" button take available space
                              child: ElevatedButton(
                                onPressed: () {
                                  addToCartAndMaybeCheckout(false);
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  textStyle: const TextStyle(fontSize: 12)
                                ),
                                child: const Text('Add'),
                              ),
                            ),
                            const SizedBox(width: 4),
                            Expanded( // Make "Buy" button take available space
                              child: ElevatedButton(
                                onPressed: () {
                                  addToCartAndMaybeCheckout(true);
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  textStyle: const TextStyle(fontSize: 12)
                                ),
                                child: const Text('Buy'),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
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
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                qty = max(1, qty - 1);
              });
            },
            child: const Icon(Icons.remove, size: 16),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(qty.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                qty += 1;
              });
            },
            child: const Icon(Icons.add, size: 16),
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${widget.cake.name} added to cart!')),
      );
    }
  }
}
