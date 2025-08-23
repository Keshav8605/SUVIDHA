import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class StartScreen3 extends StatelessWidget {
  const StartScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              // Expanded section for title + subtitle
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      "assets/animations/ai_lottie.json",
                      width: 300,
                    ),
                    const Spacer(flex: 2),

                    // Title
                    Text(
                      'Smart & Seamless',
                      style: GoogleFonts.montserrat(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 8),

                    // Subtitle
                    Text(
                      'Experience faster service with\nAI-powered solutions.',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        color: const Color(0xFF656565),
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 60),
                  ],
                ),
              ),

              // Bottom navigation
              Column(
                children: [
                  // Dots indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildDot(false),
                      const SizedBox(width: 8),
                      _buildDot(false),
                      const SizedBox(width: 8),
                      _buildDot(true),
                    ],
                  ),
                  const SizedBox(height: 60),

                  // Prev + Next (Next can later go to Home/Login page)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Prev button
                      TextButton.icon(
                        onPressed: () {
                          Navigator.pop(context); // Go back to Screen 2
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 18,
                          color: Colors.black,
                        ),
                        label: Text(
                          'Prev',
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),

                      // Next button (currently placeholder)
                      SizedBox(
                        width: 121,
                        height: 47.5,
                        child: ElevatedButton(
                          onPressed: () {
                            // TODO: Navigate to Home/Login page
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0x33468AFF),
                            foregroundColor: const Color(0xFF468AFF),
                            elevation: 0,
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
                    ],
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

  // Dot builder (same as StartScreen1 & 2)
  Widget _buildDot(bool isActive) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF468AFF) : Colors.grey.shade300,
        shape: BoxShape.circle,
      ),
    );
  }
}
