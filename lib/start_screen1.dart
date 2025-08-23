import 'package:cdgi/start_screen2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class StartScreen1 extends StatelessWidget {
  const StartScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              // Main content area
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      "assets/animations/call_center.json",
                      width: 300,
                    ),
                    const Spacer(flex: 2),
                    // Main heading
                    Text(
                      'Always Here for You',
                      style: GoogleFonts.montserrat(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    // Subtitle
                    Text(
                      '24x7 support, anytime you need us.',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: Color(0xFF656565),
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
              // Bottom section with indicators and button
              Column(
                children: [
                  // Page indicators - dots made larger
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          color: Color(0xFF468AFF),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  // Next button with exact specifications
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: 121,
                      height: 47.5,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const StartScreen2(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0x33468AFF),
                          foregroundColor: const Color(0xFF468AFF),
                          elevation: 0,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(72),
                          ),
                        ),
                        child: Text(
                          'Next',
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 120),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
