import 'package:cdgi/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class StartScreen3 extends StatelessWidget {
  const StartScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    // ---------- responsive helpers ----------
    final double w  = Get.width;
    final double h  = Get.height;
    final bool sm   = w < 360;     // small phones
    final bool lg   = w > 600;     // large tablets / desktop

    // font sizes
    final double titleFs    = sm ? w * .055 : (lg ? 28 : w * .058);
    final double subFs      = sm ? w * .04  : (lg ? 18 : w * .042);
    final double btnFs      = sm ? w * .04  : (lg ? 18 : w * .042);
    final double prevFs     = sm ? w * .035 : (lg ? 16 : w * .04);

    // element sizes
    final double padH       = sm ? w * .05  : (lg ? 48 : w * .064);
    final double lottieSize = sm ? w * .70  : (lg ? 350 : w * .80);
    final double dotSize    = sm ? 10       : (lg ? 14 : 12);
    final double btnW       = sm ? w * .28  : (lg ? 140 : w * .32);
    final double btnH       = sm ? h * .055 : (lg ? 50  : h * .059);
    final double iconSz     = sm ? 16       : 18;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: h - MediaQuery.of(context).padding.vertical,
            maxWidth: lg ? 600 : double.infinity,
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: padH),
              child: Column(
                children: [
                  // ---------- animation ----------
                  SizedBox(height: sm ? h * .02 : h * .03),
                  Lottie.asset(
                    'assets/animations/ai_lottie.json',
                    width: lottieSize,
                    height: lottieSize,
                    fit: BoxFit.contain,
                  ),

                  // ---------- title / subtitle ----------
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: sm ? h * .04 : h * .06),
                        Text(
                          'Smart & Seamless',
                          style: GoogleFonts.montserrat(
                            fontSize: titleFs,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: sm ? h * .008 : h * .01),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: sm ? w * .02 : w * .04,
                          ),
                          child: Text(
                            'Experience faster service with\nAI-powered solutions.',
                            style: GoogleFonts.montserrat(
                              fontSize: subFs,
                              color: const Color(0xFF656565),
                              height: 1.4,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: sm ? h * .06 : h * .08),
                      ],
                    ),
                  ),

                  // ---------- bottom nav ----------
                  Column(
                    children: [
                      // dots
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _dot(false, dotSize),
                          SizedBox(width: sm ? 6 : 8),
                          _dot(false, dotSize),
                          SizedBox(width: sm ? 6 : 8),
                          _dot(true,  dotSize),
                        ],
                      ),
                      SizedBox(height: sm ? h * .04 : h * .06),

                      // prev | next
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Prev
                          TextButton.icon(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(Icons.arrow_back,
                                size: iconSz, color: Colors.black),
                            label: Text(
                              'Prev',
                              style: GoogleFonts.montserrat(
                                fontSize: prevFs,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: sm ? 8 : 12,
                                vertical: sm ? 8 : 10,
                              ),
                            ),
                          ),

                          // Next
                          SizedBox(
                            width: btnW,
                            height: btnH,
                            child: ElevatedButton(
                              onPressed: () => Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (_) => const LoginScreen(),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0x33468AFF),
                                foregroundColor: const Color(0xFF468AFF),
                                elevation: 0,
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      sm ? 60 : 72),
                                ),
                              ),
                              child: Text(
                                'Next',
                                style: GoogleFonts.montserrat(
                                  fontSize: btnFs,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: sm ? h * .08 : h * .12),
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

  // ---------- helper ----------
  Widget _dot(bool active, double size) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: active ? const Color(0xFF468AFF) : Colors.grey.shade300,
      shape: BoxShape.circle,
    ),
  );
}
