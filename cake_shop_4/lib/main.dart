import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const SweetBitesApp());
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomePage(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F6F3), // cream color background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Mixer Icon (symbolic)
            Icon(
              Icons.kitchen, // logo માટે mixer જેવા symbol
              size: 90,
              color: Colors.brown.shade400,
            ),

            const SizedBox(height: 10),

            // Sweet Bites Title (Cursive Font)
            Text(
              "Sweet Bites",
              style: GoogleFonts.dancingScript(
                fontSize: 42,
                color: Colors.brown.shade700,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 5),

            // Tagline
            Text(
              "Sweet & Delicious",
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.brown.shade500,
                letterSpacing: 1.2,
              ),
            ),

            const SizedBox(height: 5),

            // Established Year
            Text(
              "Est. 2025",
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.brown.shade400,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SweetBitesApp extends StatelessWidget {
  const SweetBitesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: AppState.themeMode,
      builder: (context, mode, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sweet Bites',
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.pink,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent.withAlpha(230),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.deepPurple,
            scaffoldBackgroundColor: const Color(0xFF121212),
            cardColor: const Color(0xFF1E1E1E),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF1E1E1E),
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.white),
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Color(0xFF1E1E1E),
              selectedItemColor: Colors.deepPurpleAccent,
              unselectedItemColor: Colors.grey,
            ),
          ),
          themeMode: mode,
          home: const SplashScreen(),
        );
      },
    );
  }
}

// Simple product model
class Cake {
  final int id;
  final String name;
  final String desc;
  final double price;
  final String image;
  final String category;
  Cake({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.image,
    required this.category,
  });
}

// Cart item
class CartItem {
  final Cake cake;
  int qty;
  CartItem({required this.cake, this.qty = 1});
}

// Global app state using ValueNotifiers (keeps this single-file and simple)
class AppState {
  static final ValueNotifier<ThemeMode> themeMode = ValueNotifier(
    ThemeMode.light,
  );
  static final ValueNotifier<List<CartItem>> cart = ValueNotifier([]);
  static final ValueNotifier<Set<int>> wishlist = ValueNotifier({});
  static final ValueNotifier<String> searchQuery = ValueNotifier('');
}

// Sample data
final List<Cake> sampleCakes = [
  Cake(
    id: 0,
    name: 'Black Forest Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1000.0,
    image: 'assets/images/Black Forest Cake.png',
    category: 'Classic',
  ),
  Cake(
    id: 1,
    name: 'Red Velvet Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 750.0,
    image: 'assets/images/Red Velvet Cake.png',
    category: 'Classic',
  ),
  Cake(
    id: 2,
    name: 'Pineapple Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 500.0,
    image: 'assets/images/Pineapple Cake.png',
    category: 'Classic',
  ),
  Cake(
    id: 3,
    name: 'Chocolate Truffle Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1250.0,
    image: 'assets/images/Chocolate Truffle Cake.png',
    category: 'Classic',
  ),
  Cake(
    id: 4,
    name: 'Vanilla Sponge Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 600.0,
    image: 'assets/images/Vanilla Sponge Cake.png',
    category: 'Classic',
  ),
  Cake(
    id: 5,
    name: 'Butterscotch Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 800.0,
    image: 'assets/images/Butterscotch Cake.png',
    category: 'Classic',
  ),
  Cake(
    id: 6,
    name: 'White Forest Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 950.0,
    image: 'assets/images/White Forest Cake.png',
    category: 'Classic',
  ),
  Cake(
    id: 7,
    name: 'Coffee Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 700.0,
    image: 'assets/images/Coffee Cake.png',
    category: 'Classic',
  ),
  Cake(
    id: 8,
    name: 'Marble Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 850.0,
    image: 'assets/images/Marble Cake.png',
    category: 'Classic',
  ),
  Cake(
    id: 9,
    name: 'Pound Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 450.0,
    image: 'assets/images/Pound Cake.png',
    category: 'Classic',
  ),
  Cake(
    id: 10,
    name: 'Choco Lava Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1100.0,
    image: 'assets/images/Choco Lava Cake.png',
    category: 'Chocolate Lover',
  ),
  Cake(
    id: 11,
    name: 'Chocolate Mousse Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1300.0,
    image: 'assets/images/Chocolate Mousse Cake.png',
    category: 'Chocolate Lover',
  ),
  Cake(
    id: 12,
    name: 'Ferrero Rocher Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1450.0,
    image: 'assets/images/Ferrero Rocher Cake.png',
    category: 'Chocolate Lover',
  ),
  Cake(
    id: 13,
    name: 'Dark Chocolate Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1200.0,
    image: 'assets/images/Dark Chocolate Cake.png',
    category: 'Chocolate Lover',
  ),
  Cake(
    id: 14,
    name: 'KitKat Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 900.0,
    image: 'assets/images/KitKat Cake.png',
    category: 'Chocolate Lover',
  ),
  Cake(
    id: 15,
    name: 'Oreo Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 850.0,
    image: 'assets/images/Oreo Cake.png',
    category: 'Chocolate Lover',
  ),
  Cake(
    id: 16,
    name: 'Nutella Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1350.0,
    image: 'assets/images/Nutella Cake.png',
    category: 'Chocolate Lover',
  ),
  Cake(
    id: 17,
    name: 'Belgian Chocolate Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1500.0,
    image: 'assets/images/Belgian Chocolate Cake.png',
    category: 'Chocolate Lover',
  ),
  Cake(
    id: 18,
    name: 'Mocha Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1050.0,
    image: 'assets/images/Mocha Cake.png',
    category: 'Chocolate Lover',
  ),
  Cake(
    id: 19,
    name: 'Choco Chip Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 980.0,
    image: 'assets/images/Choco Chip Cake.png',
    category: 'Chocolate Lover',
  ),
  Cake(
    id: 20,
    name: 'Strawberry Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 700.0,
    image: 'assets/images/Strawberry Cake.png',
    category: 'Fruit-Based',
  ),
  Cake(
    id: 21,
    name: 'Blueberry Cheesecake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1100.0,
    image: 'assets/images/Blueberry Cheesecake.png',
    category: 'Fruit-Based',
  ),
  Cake(
    id: 22,
    name: 'Mango Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 950.0,
    image: 'assets/images/Mango Cake.png',
    category: 'Fruit-Based',
  ),
  Cake(
    id: 23,
    name: 'Raspberry Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 800.0,
    image: 'assets/images/Raspberry Cake.png',
    category: 'Fruit-Based',
  ),
  Cake(
    id: 24,
    name: 'Kiwi Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 750.0,
    image: 'assets/images/Kiwi Cake.png',
    category: 'Fruit-Based',
  ),
  Cake(
    id: 25,
    name: 'Mixed Fruit Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1000.0,
    image: 'assets/images/Mixed Fruit Cake.png',
    category: 'Fruit-Based',
  ),
  Cake(
    id: 26,
    name: 'Lemon Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 650.0,
    image: 'assets/images/Lemon Cake.png',
    category: 'Fruit-Based',
  ),
  Cake(
    id: 27,
    name: 'Coconut Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 880.0,
    image: 'assets/images/Coconut Cake.png',
    category: 'Fruit-Based',
  ),
  Cake(
    id: 28,
    name: 'Banana Walnut Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 720.0,
    image: 'assets/images/Banana Walnut Cake.png',
    category: 'Fruit-Based',
  ),
  Cake(
    id: 29,
    name: 'Orange Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 680.0,
    image: 'assets/images/Orange Cake.png',
    category: 'Fruit-Based',
  ),
  Cake(
    id: 30,
    name: 'New York Cheesecake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1300.0,
    image: 'assets/images/New York Cheesecake.png',
    category: 'Cheesecakes & Creamy',
  ),
  Cake(
    id: 31,
    name: 'Chocolate Cheesecake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1400.0,
    image: 'assets/images/Chocolate Cheesecake.png',
    category: 'Cheesecakes & Creamy',
  ),
  Cake(
    id: 32,
    name: 'Mango Cheesecake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1250.0,
    image: 'assets/images/Mango Cheesecake.png',
    category: 'Cheesecakes & Creamy',
  ),
  Cake(
    id: 33,
    name: 'Baked Cheesecake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1150.0,
    image: 'assets/images/Baked Cheesecake.png',
    category: 'Cheesecakes & Creamy',
  ),
  Cake(
    id: 34,
    name: 'Strawberry Cheesecake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1200.0,
    image: 'assets/images/Strawberry Cheesecake.png',
    category: 'Cheesecakes & Creamy',
  ),
  Cake(
    id: 35,
    name: 'Oreo Cheesecake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1050.0,
    image: 'assets/images/Oreo Cheesecake.png',
    category: 'Cheesecakes & Creamy',
  ),
  Cake(
    id: 36,
    name: 'Tiramisu Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1350.0,
    image: 'assets/images/Tiramisu Cake.png',
    category: 'Cheesecakes & Creamy',
  ),
  Cake(
    id: 37,
    name: 'Tres Leches Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1100.0,
    image: 'assets/images/Tres Leches Cake.png',
    category: 'Cheesecakes & Creamy',
  ),
  Cake(
    id: 38,
    name: 'Ice Cream Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 900.0,
    image: 'assets/images/Ice Cream Cake.png',
    category: 'Cheesecakes & Creamy',
  ),
  Cake(
    id: 39,
    name: 'Mousse Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1000.0,
    image: 'assets/images/Mousse Cake.png',
    category: 'Cheesecakes & Creamy',
  ),
  Cake(
    id: 40,
    name: 'Almond Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 950.0,
    image: 'assets/images/Almond Cake.png',
    category: 'Nutty',
  ),
  Cake(
    id: 41,
    name: 'Pistachio Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1100.0,
    image: 'assets/images/Pistachio Cake.png',
    category: 'Nutty',
  ),
  Cake(
    id: 42,
    name: 'Cashew Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1000.0,
    image: 'assets/images/Cashew Cake.png',
    category: 'Nutty',
  ),
  Cake(
    id: 43,
    name: 'Walnut Brownie Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 850.0,
    image: 'assets/images/Walnut Brownie Cake.png',
    category: 'Nutty',
  ),
  Cake(
    id: 44,
    name: 'Hazelnut Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1200.0,
    image: 'assets/images/Hazelnut Cake.png',
    category: 'Nutty',
  ),
  Cake(
    id: 45,
    name: 'Pecan Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1050.0,
    image: 'assets/images/Pecan Cake.png',
    category: 'Nutty',
  ),
  Cake(
    id: 46,
    name: 'Peanut Butter Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 900.0,
    image: 'assets/images/Peanut Butter Cake.png',
    category: 'Nutty',
  ),
  Cake(
    id: 47,
    name: 'Coconut Almond Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 980.0,
    image: 'assets/images/Coconut Almond Cake.png',
    category: 'Nutty',
  ),
  Cake(
    id: 48,
    name: 'Dry Fruit Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 750.0,
    image: 'assets/images/Dry Fruit Cake.png',
    category: 'Nutty',
  ),
  Cake(
    id: 49,
    name: 'Tutti Frutti Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 600.0,
    image: 'assets/images/Tutti Frutti Cake.png',
    category: 'Nutty',
  ),
  Cake(
    id: 50,
    name: 'Fondant Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1500.0,
    image: 'assets/images/Fondant Cake.png',
    category: 'Premium & Designer',
  ),
  Cake(
    id: 51,
    name: 'Tiered Wedding Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1400.0,
    image: 'assets/images/Tiered Wedding Cake.png',
    category: 'Premium & Designer',
  ),
  Cake(
    id: 52,
    name: 'Photo Print Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1200.0,
    image: 'assets/images/Photo Print Cake.png',
    category: 'Premium & Designer',
  ),
  Cake(
    id: 53,
    name: 'Unicorn Theme Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1300.0,
    image: 'assets/images/Unicorn Theme Cake.png',
    category: 'Premium & Designer',
  ),
  Cake(
    id: 54,
    name: 'Rainbow Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1100.0,
    image: 'assets/images/Rainbow Cake.png',
    category: 'Premium & Designer',
  ),
  Cake(
    id: 55,
    name: 'Rose Swirl Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1000.0,
    image: 'assets/images/Rose Swirl Cake.png',
    category: 'Premium & Designer',
  ),
  Cake(
    id: 56,
    name: 'Barbie Doll Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1250.0,
    image: 'assets/images/Barbie Doll Cake.png',
    category: 'Premium & Designer',
  ),
  Cake(
    id: 57,
    name: 'Bomb Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 950.0,
    image: 'assets/images/Bomb Cake.png',
    category: 'Premium & Designer',
  ),
  Cake(
    id: 58,
    name: 'Pinata Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1050.0,
    image: 'assets/images/Pinata Cake.png',
    category: 'Premium & Designer',
  ),
  Cake(
    id: 59,
    name: 'Heart Shape Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 800.0,
    image: 'assets/images/Heart Shape Cake.png',
    category: 'Premium & Designer',
  ),
  Cake(
    id: 60,
    name: 'Christmas Plum Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 900.0,
    image: 'assets/images/Christmas Plum Cake.png',
    category: 'Festive',
  ),
  Cake(
    id: 61,
    name: 'Easter Bunny Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 850.0,
    image: 'assets/images/Easter Bunny Cake.png',
    category: 'Festive',
  ),
  Cake(
    id: 62,
    name: 'Diwali Dry Fruit Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1000.0,
    image: 'assets/images/Diwali Dry Fruit Cake.png',
    category: 'Festive',
  ),
  Cake(
    id: 63,
    name: 'Valentine Special Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1100.0,
    image: 'assets/images/Valentine Special Cake.png',
    category: 'Festive',
  ),
  Cake(
    id: 64,
    name: 'Holi Colour Splash Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 950.0,
    image: 'assets/images/Holi Colour Splash Cake.png',
    category: 'Festive',
  ),
  Cake(
    id: 65,
    name: 'New Year Countdown Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1200.0,
    image: 'assets/images/New Year Countdown Cake.png',
    category: 'Festive',
  ),
  Cake(
    id: 66,
    name: 'Independence Day Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 700.0,
    image: 'assets/images/Independence Day Cake.png',
    category: 'Festive',
  ),
  Cake(
    id: 67,
    name: 'Halloween Pumpkin Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 800.0,
    image: 'assets/images/Halloween Pumpkin Cake.png',
    category: 'Festive',
  ),
  Cake(
    id: 68,
    name: 'Mother’s Day Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1050.0,
    image: 'assets/images/Mother’s Day Cake.png',
    category: 'Festive',
  ),
  Cake(
    id: 69,
    name: 'Father’s Day Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 980.0,
    image: 'assets/images/Father’s Day Cake.png',
    category: 'Festive',
  ),
  Cake(
    id: 70,
    name: 'Sugar-Free Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1100.0,
    image: 'assets/images/Sugar-Free Cake.png',
    category: 'Healthy / Special',
  ),
  Cake(
    id: 71,
    name: 'Vegan Chocolate Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1200.0,
    image: 'assets/images/Vegan Chocolate Cake.png',
    category: 'Healthy / Special',
  ),
  Cake(
    id: 72,
    name: 'Gluten-Free Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1000.0,
    image: 'assets/images/Gluten-Free Cake.png',
    category: 'Healthy / Special',
  ),
  Cake(
    id: 73,
    name: 'Whole Wheat Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 800.0,
    image: 'assets/images/Whole Wheat Cake.png',
    category: 'Healthy / Special',
  ),
  Cake(
    id: 74,
    name: 'Ragi Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 750.0,
    image: 'assets/images/Ragi Cake.png',
    category: 'Healthy / Special',
  ),
  Cake(
    id: 75,
    name: 'Oats Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 700.0,
    image: 'assets/images/Oats Cake.png',
    category: 'Healthy / Special',
  ),
  Cake(
    id: 76,
    name: 'Dates & Walnut Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 950.0,
    image: 'assets/images/Dates & Walnut Cake.png',
    category: 'Healthy / Special',
  ),
  Cake(
    id: 77,
    name: 'Honey Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 850.0,
    image: 'assets/images/Honey Cake.png',
    category: 'Healthy / Special',
  ),
  Cake(
    id: 78,
    name: 'Carrot Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 900.0,
    image: 'assets/images/Carrot Cake.png',
    category: 'Healthy / Special',
  ),
  Cake(
    id: 79,
    name: 'Beetroot Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 780.0,
    image: 'assets/images/Beetroot Cake.png',
    category: 'Healthy / Special',
  ),
  Cake(
    id: 80,
    name: 'Opera Cake (France)',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1400.0,
    image: 'assets/images/Opera Cake (France).png',
    category: 'International',
  ),
  Cake(
    id: 81,
    name: 'Sacher Torte (Austria)',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1300.0,
    image: 'assets/images/Sacher Torte (Austria).png',
    category: 'International',
  ),
  Cake(
    id: 82,
    name: 'Mille-Feuille (France)',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1200.0,
    image: 'assets/images/Mille-Feuille (France).png',
    category: 'International',
  ),
  Cake(
    id: 83,
    name: 'Genoise Cake (Italy)',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1100.0,
    image: 'assets/images/Genoise Cake (Italy).png',
    category: 'International',
  ),
  Cake(
    id: 84,
    name: 'Victoria Sponge (UK)',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 900.0,
    image: 'assets/images/Victoria Sponge (UK).png',
    category: 'International',
  ),
  Cake(
    id: 85,
    name: 'Lamington (Australia)',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 800.0,
    image: 'assets/images/Lamington (Australia).png',
    category: 'International',
  ),
  Cake(
    id: 86,
    name: 'Pavlova Cake (New Zealand)',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1000.0,
    image: 'assets/images/Pavlova Cake (New Zealand).png',
    category: 'International',
  ),
  Cake(
    id: 87,
    name: 'Battenberg Cake (UK)',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 950.0,
    image: 'assets/images/Battenberg Cake (UK).png',
    category: 'International',
  ),
  Cake(
    id: 88,
    name: 'Kue Lapis (Indonesia)',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1150.0,
    image: 'assets/images/Kue Lapis (Indonesia).png',
    category: 'International',
  ),
  Cake(
    id: 89,
    name: 'Chiffon Cake (Japan)',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1050.0,
    image: 'assets/images/Chiffon Cake (Japan).png',
    category: 'International',
  ),
  Cake(
    id: 90,
    name: 'Gulab Jamun Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1200.0,
    image: 'assets/images/Gulab Jamun Cake.png',
    category: 'Unique Flavour',
  ),
  Cake(
    id: 91,
    name: 'Rasmalai Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1300.0,
    image: 'assets/images/Rasmalai Cake.png',
    category: 'Unique Flavour',
  ),
  Cake(
    id: 92,
    name: 'Paan Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1000.0,
    image: 'assets/images/Paan Cake.png',
    category: 'Unique Flavour',
  ),
  Cake(
    id: 93,
    name: 'Rose Milk Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 950.0,
    image: 'assets/images/Rose Milk Cake.png',
    category: 'Unique Flavour',
  ),
  Cake(
    id: 94,
    name: 'Thandai Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1100.0,
    image: 'assets/images/Thandai Cake.png',
    category: 'Unique Flavour',
  ),
  Cake(
    id: 95,
    name: 'Gajar Halwa Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1050.0,
    image: 'assets/images/Gajar Halwa Cake.png',
    category: 'Unique Flavour',
  ),
  Cake(
    id: 96,
    name: 'Coconut Gulkand Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1150.0,
    image: 'assets/images/Coconut Gulkand Cake.png',
    category: 'Unique Flavour',
  ),
  Cake(
    id: 97,
    name: 'Motichoor Ladoo Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1250.0,
    image: 'assets/images/Motichoor Ladoo Cake.png',
    category: 'Unique Flavour',
  ),
  Cake(
    id: 98,
    name: 'Kesar Pista Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1350.0,
    image: 'assets/images/Kesar Pista Cake.png',
    category: 'Unique Flavour',
  ),
  Cake(
    id: 99,
    name: 'Rabdi Cake',
    desc: 'Delicious and fresh - perfect for celebrations',
    price: 1400.0,
    image: 'assets/images/Rabdi Cake.png',
    category: 'Unique Flavour',
  ),
];

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
      final matchCategory = activeCategory == 'All'
          ? true
          : c.category == activeCategory;
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
    final list = filteredCakes();
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: list.length,
      itemBuilder: (context, i) {
        final c = list[i];
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
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              addToCartAndMaybeCheckout(false);
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              textStyle: const TextStyle(fontSize: 12)
                            ),
                            child: const Text('Add'),
                          ),
                          const SizedBox(width: 4),
                          ElevatedButton(
                            onPressed: () {
                              addToCartAndMaybeCheckout(true);
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              textStyle: const TextStyle(fontSize: 12)
                            ),
                            child: const Text('Buy'),
                          ),
                        ],
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
            onTap: () => setState(() => qty = max(1, qty - 1)),
            child: const Icon(Icons.remove, size: 16),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '$qty',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          GestureDetector(
            onTap: () => setState(() => qty = qty + 1),
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
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      addToCartAndMaybeCheckout(false);
                    },
                    child: const Text('Add to Cart'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      addToCartAndMaybeCheckout(true);
                    },
                    child: const Text('Buy Now'),
                  ),
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

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userName = 'User Name';
  String userEmail = 'user@example.com';

  void _editProfile() {
    final nameController = TextEditingController(text: userName);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Profile'),
        content: TextField(
          controller: nameController,
          decoration: const InputDecoration(labelText: 'User Name'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                userName = nameController.text;
              });
              Navigator.of(context).pop();
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _logout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Logged out successfully!')), 
              );
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(radius: 36, child: Icon(Icons.person, size: 36)),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(userEmail),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: _editProfile,
                ),
              ],
            ),
            const SizedBox(height: 24),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Settings page is not implemented yet.')),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Orders'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const OrderPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: _logout,
            ),
          ],
        ),
      ),
    );
  }
}

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
            ElevatedButton(
              onPressed: () {
                final id = Random().nextInt(900000) + 100000;
                AppState.cart.value = [];
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => OrderSuccessPage(orderId: id.toString()),
                  ),
                );
              },
              child: const Text('Place Order'),
            ),
          ],
        ),
      ),
    );
  }
}

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
                child: const Text('Continue Shopping'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    final categories = [
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

    final cakesInCategory = selectedCategory == null
        ? sampleCakes
        : sampleCakes
            .where((cake) => cake.category == selectedCategory)
            .toList();

    return Scaffold(
      appBar: AppBar(
        leading: selectedCategory != null
            ? BackButton(onPressed: () => setState(() => selectedCategory = null))
            : null,
        title: Text(selectedCategory ?? 'Categories'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedCategory = null;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedCategory == null
                    ? Colors.pinkAccent.withAlpha(230)
                    : Theme.of(context).cardColor,
                foregroundColor: selectedCategory == null
                    ? Colors.white
                    : Theme.of(context).textTheme.bodyLarge?.color,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'All Cakes',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: selectedCategory == null
                  ? ListView.builder(
                      key: const ValueKey('categoryList'),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedCategory = category;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink[50],
                              padding: const EdgeInsets.all(12),
                            ),
                            child: Text(
                              category,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        );
                      },
                    )
                  : GridView.builder(
                      key: const ValueKey('cakeGrid'),
                      padding: const EdgeInsets.all(16),
                      itemCount: cakesInCategory.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.85,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemBuilder: (context, i) {
                        final cake = cakesInCategory[i];
                        return CakeCard(
                          cake: cake,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => CakeDetailsPage(cake: cake),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class AutoScrollingBanner extends StatefulWidget {
  const AutoScrollingBanner({super.key});

  @override
  State<AutoScrollingBanner> createState() => _AutoScrollingBannerState();
}

class _AutoScrollingBannerState extends State<AutoScrollingBanner> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  late Timer _timer;

  final List<String> _bannerImages = [
    'assets/images/Black Forest Cake.png',
    'assets/images/Red Velvet Cake.png',
    'assets/images/Pineapple Cake.png',
    'assets/images/Chocolate Truffle Cake.png',
    'assets/images/Vanilla Sponge Cake.png',
    'assets/images/Butterscotch Cake.png',
    'assets/images/White Forest Cake.png',
    'assets/images/Coffee Cake.png',
  ];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_pageController.hasClients) {
        if (_currentPage < _bannerImages.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }

        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: PageView.builder(
        controller: _pageController,
        itemCount: _bannerImages.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                image: AssetImage(_bannerImages[index]),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

class Order {
  final String id;
  final List<CartItem> items;
  final double total;
  final DateTime date;
  final String status;

  Order({
    required this.id,
    required this.items,
    required this.total,
    required this.date,
    required this.status,
  });
}

final List<Order> sampleOrders = [
  Order(
    id: '#123456',
    items: [
      CartItem(cake: sampleCakes[0], qty: 1),
      CartItem(cake: sampleCakes[2], qty: 2),
    ],
    total: 2000.0,
    date: DateTime.now().subtract(const Duration(days: 2)),
    status: 'Delivered',
  ),
  Order(
    id: '#789012',
    items: [
      CartItem(cake: sampleCakes[5], qty: 1),
    ],
    total: 800.0,
    date: DateTime.now().subtract(const Duration(days: 5)),
    status: 'Delivered',
  ),
  Order(
    id: '#345678',
    items: [
      CartItem(cake: sampleCakes[10], qty: 1),
      CartItem(cake: sampleCakes[12], qty: 1),
    ],
    total: 2550.0,
    date: DateTime.now().subtract(const Duration(days: 10)),
    status: 'Cancelled',
  ),
];

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Orders'),
      ),
      body: ListView.builder(
        itemCount: sampleOrders.length,
        itemBuilder: (context, index) {
          final order = sampleOrders[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order ${order.id}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text('Date: ${order.date.day}/${order.date.month}/${order.date.year}'),
                  const SizedBox(height: 4),
                  Text('Total: \u20B9${order.total.toStringAsFixed(0)}'),
                  const SizedBox(height: 4),
                  Text('Status: ${order.status}'),
                  const SizedBox(height: 8),
                  ...order.items.map((item) => ListTile(
                        leading: Image.asset(
                          item.cake.image,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(item.cake.name),
                        subtitle: Text('Qty: ${item.qty}'),
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CartPage extends StatefulWidget {
  final bool autoCheckout;
  const CartPage({super.key, this.autoCheckout = false});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    if (widget.autoCheckout) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (AppState.cart.value.isNotEmpty) {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => const CheckoutPage()),
          );
        }
      });
    }
  }

  void increaseQuantity(CartItem item) {
    final list = List<CartItem>.from(AppState.cart.value);
    final index = list.indexWhere((e) => e.cake.id == item.cake.id);
    if (index >= 0) {
      list[index].qty++;
      AppState.cart.value = list;
    }
  }

  void decreaseQuantity(CartItem item) {
    final list = List<CartItem>.from(AppState.cart.value);
    final index = list.indexWhere((e) => e.cake.id == item.cake.id);
    if (index >= 0 && list[index].qty > 1) {
      list[index].qty--;
      AppState.cart.value = list;
    }
  }

  void removeItem(CartItem item) {
    final list = List<CartItem>.from(AppState.cart.value);
    list.removeWhere((e) => e.cake.id == item.cake.id);
    AppState.cart.value = list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🛒 My Cart'),
      ),
      body: ValueListenableBuilder<List<CartItem>>(
        valueListenable: AppState.cart,
        builder: (context, cart, _) {
          if (cart.isEmpty) {
            return const Center(
              child: Text(
                'Your cart is empty 🧁',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            );
          }

          final total = cart.fold(
            0.0,
            (sum, item) => sum + item.cake.price * item.qty,
          );

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cart.length,
                  itemBuilder: (context, index) {
                    final item = cart[index];
                    return Card(
                      margin: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 4,
                      child: ListTile(
                        leading: Image.asset(
                          item.cake.image,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                        title: Text(item.cake.name),
                        subtitle: Text('₹${item.cake.price}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              onPressed: () => decreaseQuantity(item),
                            ),
                            Text('${item.qty}'),
                            IconButton(
                              icon: const Icon(Icons.add_circle_outline),
                              onPressed: () => increaseQuantity(item),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => removeItem(item),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '₹$total',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const CheckoutPage(),
                          ),
                        );
                      },
                      child: const Text(
                        'Checkout',
                        style: TextStyle(fontSize: 18),
                      ),
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