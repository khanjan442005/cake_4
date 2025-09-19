
import 'package:flutter/material.dart';
import 'home_screen.dart';

class OrderSuccessPage extends StatefulWidget {
  final String orderId;
  const OrderSuccessPage({super.key, required this.orderId});
  @override
  State<OrderSuccessPage> createState() => _OrderSuccessPageState();
}

class _OrderSuccessPageState extends State<OrderSuccessPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch, // Added this
            children: [
              ScaleTransition(
                scale: CurvedAnimation(
                  parent: _controller,
                  curve: Curves.elasticOut,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(24),
                  child: const Icon(
                    Icons.check_circle,
                    size: 96,
                    color: Colors.green,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Thank you!',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Your order has been placed successfully.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Order ID: ${widget.orderId}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const HomePage()),
                  (route) => false,
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50), // Make button full width
                ),
                child: const Text('Continue Shopping'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
