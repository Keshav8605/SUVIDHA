import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'home2.dart';

class Home1 extends StatelessWidget {
  const Home1({super.key});

  @override
  Widget build(BuildContext context) {
    // Responsive variables using SizeConfig approach
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double sizeConfigW = screenWidth / 100;
    double sizeConfigH = screenHeight / 100;

    bool isSmallScreen = screenWidth < 360;
    bool isLargeScreen = screenWidth > 600;

    // Responsive font sizes
    double titleFontSize = isSmallScreen
        ? sizeConfigW * 6
        : (isLargeScreen ? sizeConfigW * 7 : sizeConfigW * 6.5);
    double headerFontSize = isSmallScreen
        ? sizeConfigW * 5.5
        : (isLargeScreen ? sizeConfigW * 6.5 : sizeConfigW * 6);
    double subtitleFontSize = isSmallScreen
        ? sizeConfigW * 3.5
        : (isLargeScreen ? sizeConfigW * 4.5 : sizeConfigW * 4);
    double bodyFontSize = isSmallScreen
        ? sizeConfigW * 3
        : (isLargeScreen ? sizeConfigW * 4 : sizeConfigW * 3.5);
    double buttonFontSize = isSmallScreen
        ? sizeConfigW * 4
        : (isLargeScreen ? sizeConfigW * 5 : sizeConfigW * 4.5);
    double quoteFontSize = isSmallScreen
        ? sizeConfigW * 3
        : (isLargeScreen ? sizeConfigW * 4 : sizeConfigW * 3.5);

    // Responsive padding and margins
    double horizontalPadding = isSmallScreen
        ? sizeConfigW * 6
        : (isLargeScreen ? sizeConfigW * 12 : sizeConfigW * 8);
    double buttonHeight = isSmallScreen
        ? sizeConfigH * 6
        : (isLargeScreen ? sizeConfigH * 7 : sizeConfigH * 6.5);

    // Voice animation size
    double animationSize = screenWidth * 0.8;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar with SUVIDHA title
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: sizeConfigH * 2,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: const Color(0xFF468AFF).withOpacity(0.1),
                    width: 1,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SUVIDHA',
                    style: GoogleFonts.montserrat(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..shader = const LinearGradient(
                          colors: [
                            Color(0xFF468AFF),
                            Color(0xFF8969FF),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ).createShader(
                          Rect.fromLTWH(0.0, 0.0, 200.0, titleFontSize * 1.2),
                        ),
                    ),
                  ),
                  SizedBox(height: sizeConfigH * 0.5),
                  // Gradient line below SUVIDHA
                  Container(
                    width: sizeConfigW * 20, // Adjust width as needed
                    height: 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1.5),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF6F01FF),
                          Color(0xFFB172FF),
                          Color(0xFF4332FF),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Main Content
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Spacer to push content up slightly
                    const Spacer(flex: 1),

                    // Welcome to SUVIDHA! title
                    Text(
                      'Welcome to SUVIDHA!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: headerFontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),

                    SizedBox(height: sizeConfigH * 1),

                    // Your Voice, Our Action subtitle
                    Text(
                      'Your Voice, Our Action.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: subtitleFontSize,
                        fontWeight: FontWeight.w500,
                        foreground: Paint()
                          ..shader = const LinearGradient(
                            colors: [
                              Color(0xFF6F01FF),
                              Color(0xFFB172FF),
                              Color(0xFF4332FF),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ).createShader(
                            Rect.fromLTWH(0.0, 0.0, 300.0, subtitleFontSize * 1.2),
                          ),
                      ),
                    ),

                    SizedBox(height: sizeConfigH * 6),

                    // Voice Wave Animation
                    Container(
                      width: animationSize,
                      height: animationSize * 0.35, // wave is wide, not tall
                      child: Lottie.asset(
                        'assets/animations/voice_waves.json',
                        fit: BoxFit.contain,
                        repeat: true,
                        animate: true,
                      ),
                    ),


                    SizedBox(height: sizeConfigH * 6),

                    // Description text
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: isLargeScreen ? 400 : double.infinity,
                      ),
                      child: Text(
                        'Your intelligent voice assistant for all\nmunicipal services\n—simple, fast, and reliable.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: bodyFontSize,
                          color: const Color(0xFF7D7D7D),
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                    ),

                    const Spacer(flex: 2),

                    // Get Started Button
                    Container(
                      width: isLargeScreen ? 300 : screenWidth * 0.6,
                      height: buttonHeight,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF3377FF),
                            Color(0xFFBE73FF),
                            Color(0xFF9F85FF),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: Navigate to next screen
                          Get.to(() => const Home2());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent, // transparent to show gradient
                          shadowColor: Colors.transparent,     // remove shadow so gradient looks clean
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: Text(
                          'Get Started',
                          style: GoogleFonts.montserrat(
                            fontSize: buttonFontSize,
                            fontWeight: FontWeight.w600,
                            color: Colors.white, // keep text white
                          ),
                        ),
                      ),
                    ),


                    SizedBox(height: sizeConfigH * 4),

                    // Bottom quote
                    Container(
                      constraints: BoxConstraints(
                        maxWidth: isLargeScreen ? 350 : double.infinity,
                      ),
                      child: Text(
                        '"Effortless Municipal Services. Just Speak."',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontSize: quoteFontSize,
                          color: const Color(0xFF7D7D7D),
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),

                    SizedBox(height: sizeConfigH * 4),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}