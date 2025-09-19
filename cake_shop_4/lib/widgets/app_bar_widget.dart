
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/app_data.dart';
import '../screens/cart_screen.dart';
import '../screens/wishlist_screen.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Sweet Bites',
        style: GoogleFonts.dancingScript(
          fontSize: 28,
          color: Colors.pinkAccent,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.favorite_border, size: 28),
          onPressed: () => Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => const WishlistPage())),
        ),
        IconButton(
          icon: Stack(
            children: [
              const Icon(Icons.shopping_cart_outlined, size: 28),
              ValueListenableBuilder<List<CartItem>>(
                valueListenable: AppState.cart,
                builder: (context, list, _) {
                  if (list.isEmpty) return const SizedBox.shrink();
                  return Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Center(
                        child: Text(
                          '${list.length}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const CartPage(autoCheckout: false))),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
