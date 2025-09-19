
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'home_screen.dart';

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
