import 'package:cdgi/start_screen2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class StartScreen1 extends StatelessWidget {
  const StartScreen1({super.key});

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
                    "assets/animations/call_center.json",
                    width: size / 1.2,
                    height: size / 1.2,
                    fit: BoxFit.contain,
                  ),

                  // Spacer
                  SizedBox(height: size / 5),

                  // Main heading
                  Text(
                    'Always Here for You',
                    style: GoogleFonts.montserrat(
                      fontSize: size / 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: size / 40),

                  // Subtitle
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size / 20),
                    child: Text(
                      '24x7 support, anytime you need us.',
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
                      Container(
                        width: size / 35,
                        height: size / 35,
                        decoration: const BoxDecoration(
                          color: Color(0xFF468AFF),
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: size / 50),
                      Container(
                        width: size / 35,
                        height: size / 35,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: size / 50),
                      Container(
                        width: size / 35,
                        height: size / 35,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: size / 8),

                  // Next button
                  Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      width: size / 3,
                      height: size / 8,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
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
                            borderRadius: BorderRadius.circular(size / 6),
                          ),
                        ),
                        child: Text(
                          'Next',
                          style: GoogleFonts.montserrat(
                            fontSize: size / 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
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
}
