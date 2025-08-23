import 'package:cdgi/start_screen2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class StartScreen1 extends StatelessWidget {
  const StartScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    // Responsive variables
    double screenWidth = Get.width;
    double screenHeight = Get.height;
    bool isSmallScreen = screenWidth < 360;
    bool isLargeScreen = screenWidth > 600;

    // Responsive font sizes
    double titleFontSize = isSmallScreen ? screenWidth * 0.055 : (isLargeScreen ? 28 : screenWidth * 0.058);
    double subtitleFontSize = isSmallScreen ? screenWidth * 0.04 : (isLargeScreen ? 18 : screenWidth * 0.042);
    double buttonFontSize = isSmallScreen ? screenWidth * 0.04 : (isLargeScreen ? 18 : screenWidth * 0.042);

    // Responsive sizes
    double horizontalPadding = isSmallScreen ? screenWidth * 0.05 : (isLargeScreen ? 48 : screenWidth * 0.064);
    double lottieSize = isSmallScreen ? screenWidth * 0.7 : (isLargeScreen ? 350 : screenWidth * 0.8);
    double buttonWidth = isSmallScreen ? screenWidth * 0.28 : (isLargeScreen ? 140 : screenWidth * 0.32);
    double buttonHeight = isSmallScreen ? screenHeight * 0.055 : (isLargeScreen ? 50 : screenHeight * 0.059);
    double indicatorSize = isSmallScreen ? 10 : (isLargeScreen ? 14 : 12);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: screenHeight - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom,
            maxWidth: isLargeScreen ? 600 : double.infinity,
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                children: [
                  // Main content area
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Responsive top spacing
                        SizedBox(height: isSmallScreen ? screenHeight * 0.02 : screenHeight * 0.04),

                        // Lottie animation with responsive size
                        Lottie.asset(
                          "assets/animations/call_center.json",
                          width: lottieSize,
                          height: lottieSize,
                          fit: BoxFit.contain,
                        ),

                        // Flexible spacer
                        SizedBox(height: isSmallScreen ? screenHeight * 0.04 : screenHeight * 0.06),

                        // Main heading
                        Text(
                          'Always Here for You',
                          style: GoogleFonts.montserrat(
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            height: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        SizedBox(height: isSmallScreen ? screenHeight * 0.008 : screenHeight * 0.01),

                        // Subtitle
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: isSmallScreen ? screenWidth * 0.02 : screenWidth * 0.04,
                          ),
                          child: Text(
                            '24x7 support, anytime you need us.',
                            style: GoogleFonts.montserrat(
                              fontSize: subtitleFontSize,
                              color: const Color(0xFF656565),
                              height: 1.4,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        // Responsive bottom spacing
                        SizedBox(height: isSmallScreen ? screenHeight * 0.06 : screenHeight * 0.08),
                      ],
                    ),
                  ),

                  // Bottom section with indicators and button
                  Column(
                    children: [
                      // Page indicators - responsive dots
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: indicatorSize,
                            height: indicatorSize,
                            decoration: const BoxDecoration(
                              color: Color(0xFF468AFF),
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: isSmallScreen ? 6 : 8),
                          Container(
                            width: indicatorSize,
                            height: indicatorSize,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: isSmallScreen ? 6 : 8),
                          Container(
                            width: indicatorSize,
                            height: indicatorSize,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: isSmallScreen ? screenHeight * 0.04 : screenHeight * 0.06),

                      // Next button with responsive specifications
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          width: buttonWidth,
                          height: buttonHeight,
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
                                borderRadius: BorderRadius.circular(
                                    isSmallScreen ? 60 : 72
                                ),
                              ),
                            ),
                            child: Text(
                              'Next',
                              style: GoogleFonts.montserrat(
                                fontSize: buttonFontSize,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: isSmallScreen ? screenHeight * 0.08 : screenHeight * 0.12),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
