import 'package:cdgi/language_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to StartScreen1 after 3 seconds
    Timer(const Duration(seconds: 5), () {
      Get.off(
        () => LanguageSelectionScreen(),
      ); // Use Get.off to replace current route
    });
  }

  @override
  Widget build(BuildContext context) {
    // Responsive variables
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double sizeConfigW = screenWidth / 100;
    double sizeConfigH = screenHeight / 100;

    bool isSmallScreen = screenWidth < 360;
    bool isLargeScreen = screenWidth > 600;

    // Responsive font sizes
    double titleFontSize = isSmallScreen
        ? sizeConfigW * 8
        : (isLargeScreen ? sizeConfigW * 12 : sizeConfigW * 10);
    double subtitleFontSize = isSmallScreen
        ? sizeConfigW * 3.5
        : (isLargeScreen ? sizeConfigW * 4.5 : sizeConfigW * 4);

    return Scaffold(
      backgroundColor: const Color(0xFFE6EFFF), // Background color as specified
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SUVIDHA title with gradient
              Text(
                'SUVIDHA',
                style: GoogleFonts.montserrat(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..shader =
                        const LinearGradient(
                          colors: [Color(0xFF468AFF), Color(0xFF8969FF)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ).createShader(
                          Rect.fromLTWH(0.0, 0.0, 300.0, titleFontSize * 1.2),
                        ),
                ),
              ),

              SizedBox(height: sizeConfigH * 1),

              Text(
                'your_voice_our_action'.tr,
                style: GoogleFonts.montserrat(
                  fontSize: subtitleFontSize,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF7D7D7D),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
