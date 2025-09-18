import 'package:cdgi/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class StartScreen3 extends StatelessWidget {
  const StartScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    // Simple responsive variable
    double size = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size / 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Main content area
              SizedBox(height: size / 20),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Top spacing
                  SizedBox(height: size / 8),

                  // Lottie animation
                  Lottie.asset(
                    'assets/animations/ai_lottie.json',
                    width: size / 1.2,
                    height: size / 1.2,
                    fit: BoxFit.contain,
                  ),

                  // Spacer
                  SizedBox(height: size / 5),

                  Text(
                    'smart_seamless'.tr,
                    style: GoogleFonts.montserrat(
                      fontSize: size / 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: size / 40),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size / 20),
                    child: Text(
                      'ai_powered_solutions'.tr,
                      style: GoogleFonts.montserrat(
                        fontSize: size / 25,
                        color: const Color(0xFF656565),
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  // Bottom spacing
                  SizedBox(height: 0),
                ],
              ),
              SizedBox(height: size / 10),

              // Bottom section with indicators and button
              Column(
                children: [
                  // Page indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _dot(false, size / 35),
                      SizedBox(width: size / 50),
                      _dot(false, size / 35),
                      SizedBox(width: size / 50),
                      _dot(true, size / 35),
                    ],
                  ),

                  SizedBox(height: size / 8),

                  // Prev and Next buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Prev button
                      TextButton.icon(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.arrow_back,
                          size: size / 22,
                          color: Colors.black,
                        ),
                        label: Text(
                          'prev'.tr,
                          style: GoogleFonts.montserrat(
                            fontSize: size / 28,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: size / 35,
                            vertical: size / 40,
                          ),
                        ),
                      ),

                      // Next button
                      SizedBox(
                        width: size / 3,
                        height: size / 8,
                        child: ElevatedButton(
                          onPressed: () => Get.offAll(
                            LoginScreen(),
                            transition: Transition.zoom,
                            duration: Duration(milliseconds: 500),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0x33468AFF),
                            foregroundColor: const Color(0xFF468AFF),
                            elevation: 0,
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(size / 6),
                            ),
                          ),
                          child: Text(
                            'next'.tr,
                            style: GoogleFonts.montserrat(
                              fontSize: size / 25,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: size / 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method for dots
  Widget _dot(bool active, double size) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: active ? const Color(0xFF468AFF) : Colors.grey.shade300,
      shape: BoxShape.circle,
    ),
  );
}
