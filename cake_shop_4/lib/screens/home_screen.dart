import 'package:flutter/material.dart';

import '../data/app_data.dart';
// import '../data/app_state.dart'; // Redundant, AppState is in app_data.dart
import 'cart_screen.dart';
import 'category_screen.dart';
import 'order_screen.dart';
import 'profile_screen.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/auto_scrolling_banner.dart';
import '../widgets/cake_card.dart';
import 'cake_details_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final categories = [
    'All',
    'Classic',
    'Chocolate Lover',
    'Fruit-Based',
    'Cheesecakes & Creamy',
    'Nutty',
    'Premium & Designer',
    'Festive',
    'Healthy / Special',
    'International',
    'Unique Flavour',
  ];
  String activeCategory = 'All';

  @override
  Widget build(BuildContext context) {
    final pages = [
      buildHome(),
      const CartPage(autoCheckout: false),
      const CategoryPage(),
      const OrderPage(),
      const ProfilePage(),
    ];
    return Scaffold(
      body: SafeArea(child: pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Orders'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget buildHome() {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSearchAndToggle(),
              const SizedBox(height: 12),
              buildCategories(),
              const SizedBox(height: 12),
              const AutoScrollingBanner(),
              const SizedBox(height: 12),
              Text(
                'Featured',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              ValueListenableBuilder<String>(
                valueListenable: AppState.searchQuery,
                builder: (context, q, _) => buildGrid(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSearchAndToggle() {
    return Row(
      children: [
        Expanded(
          child: ValueListenableBuilder<String>(
            valueListenable: AppState.searchQuery,
            builder: (context, q, _) {
              return TextField(
                onChanged: (v) => AppState.searchQuery.value = v,
                decoration: InputDecoration(
                  hintText: 'Search cakes, e.g. Chocolate',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Theme.of(context).cardColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(width: 12),
        GestureDetector(
          onTap: () => AppState.themeMode.value =
              AppState.themeMode.value == ThemeMode.light
                  ? ThemeMode.dark
                  : ThemeMode.light,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).cardColor,
            ),
            child: Icon(
              AppState.themeMode.value == ThemeMode.light
                  ? Icons.nightlight_round
                  : Icons.wb_sunny,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCategories() {
    return SizedBox(
      height: 44,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, i) {
          final c = categories[i];
          final active = c == activeCategory;
          return GestureDetector(
            onTap: () => setState(() => activeCategory = c),
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: active
                    ? Colors.pinkAccent.withAlpha(230)
                    : Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(30),
                boxShadow: active
                    ? [
                        BoxShadow(
                          color: Colors.pink.withAlpha(51),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : null,
              ),
              child: Text(
                c,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: active ? Colors.white : null,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  List<Cake> filteredCakes() {
    final q = AppState.searchQuery.value.toLowerCase();
    List<Cake> cakes = sampleCakes.where((c) {
      final matchCategory =
          activeCategory == 'All' ? true : c.category == activeCategory;
      final matchQuery = q.isEmpty
          ? true
          : (c.name.toLowerCase().contains(q) ||
              c.desc.toLowerCase().contains(q));
      return matchCategory && matchQuery;
    }).toList();

    // Limit to 10 cakes if not 'All' category
    if (activeCategory != 'All' && cakes.length > 10) {
      return cakes.sublist(0, 10);
    }
    return cakes;
  }

  Widget buildGrid() {
    final cakes = filteredCakes();
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: cakes.length,
      itemBuilder: (context, i) {
        final c = cakes[i];
        return CakeCard(cake: c, onTap: () => openCakeDetails(c));
      },
    );
  }

  void openCakeDetails(Cake cake) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => CakeDetailsPage(cake: cake)));
  }
}
