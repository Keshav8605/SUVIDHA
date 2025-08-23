import 'package:cdgi/start_screen3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class StartScreen2 extends StatelessWidget {
  const StartScreen2({super.key});

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
    double prevButtonFontSize = isSmallScreen ? screenWidth * 0.035 : (isLargeScreen ? 16 : screenWidth * 0.04);

    // Responsive sizes
    double horizontalPadding = isSmallScreen ? screenWidth * 0.05 : (isLargeScreen ? 48 : screenWidth * 0.064);
    double lottieSize = isSmallScreen ? screenWidth * 0.7 : (isLargeScreen ? 350 : screenWidth * 0.8);
    double buttonWidth = isSmallScreen ? screenWidth * 0.28 : (isLargeScreen ? 140 : screenWidth * 0.32);
    double buttonHeight = isSmallScreen ? screenHeight * 0.055 : (isLargeScreen ? 50 : screenHeight * 0.059);
    double indicatorSize = isSmallScreen ? 10 : (isLargeScreen ? 14 : 12);
    double iconSize = isSmallScreen ? 16 : 18;

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
                  // Responsive top spacing
                  SizedBox(height: isSmallScreen ? screenHeight * 0.02 : screenHeight * 0.03),

                  // Lottie animation with responsive size
                  Lottie.asset(
                    "assets/animations/mobile_notification.json",
                    width: lottieSize,
                    height: lottieSize,
                    fit: BoxFit.contain,
                  ),

                  // Expanded content section
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Flexible spacer
                        SizedBox(height: isSmallScreen ? screenHeight * 0.04 : screenHeight * 0.06),

                        // Title
                        Text(
                          'Stay Updated',
                          style: GoogleFonts.montserrat(
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
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
                            'Get instant alerts for every\nimportant update.',
                            style: GoogleFonts.montserrat(
                              fontSize: subtitleFontSize,
                              color: const Color(0xFF656565),
                              height: 1.4,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),

                        SizedBox(height: isSmallScreen ? screenHeight * 0.06 : screenHeight * 0.08),
                      ],
                    ),
                  ),

                  // Bottom navigation section
                  Column(
                    children: [
                      // Page indicators - responsive dots
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildDot(false, indicatorSize),
                          SizedBox(width: isSmallScreen ? 6 : 8),
                          _buildDot(true, indicatorSize),
                          SizedBox(width: isSmallScreen ? 6 : 8),
                          _buildDot(false, indicatorSize),
                        ],
                      ),

                      SizedBox(height: isSmallScreen ? screenHeight * 0.04 : screenHeight * 0.06),

                      // Prev / Next buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Prev button - responsive
                          TextButton.icon(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              size: iconSize,
                              color: Colors.black,
                            ),
                            label: Text(
                              'Prev',
                              style: GoogleFonts.montserrat(
                                fontSize: prevButtonFontSize,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: isSmallScreen ? 8 : 12,
                                vertical: isSmallScreen ? 8 : 10,
                              ),
                            ),
                          ),

                          // Next button - responsive
                          SizedBox(
                            width: buttonWidth,
                            height: buttonHeight,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) => const StartScreen3(),
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
                        ],
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

  // Updated helper widget for responsive dots
  Widget _buildDot(bool isActive, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF468AFF) : Colors.grey.shade300,
        shape: BoxShape.circle,
      ),
    );
  }
}
