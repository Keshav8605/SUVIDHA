import 'package:cdgi/start_screen3.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen2 extends StatelessWidget {
  const StartScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              // Expanded content section
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(flex: 2),

                    // Title
                    Text(
                      'Stay Updated',
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
                      'Get instant alerts for every\nimportant update.',
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

              // Bottom navigation section
              Column(
                children: [
                  // Page indicators (same as StartScreen1)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildDot(false),
                      const SizedBox(width: 8),
                      _buildDot(true),
                      const SizedBox(width: 8),
                      _buildDot(false),
                    ],
                  ),
                  const SizedBox(height: 60),

                  // Prev / Next buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Prev button
                      TextButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back,
                            size: 18, color: Colors.black),
                        label: Text(
                          'Prev',
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ),

                      // Next button
                      SizedBox(
                        width: 121,
                        height: 47.5,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const StartScreen3()),
                            );
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

  // Updated helper widget for larger dots
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