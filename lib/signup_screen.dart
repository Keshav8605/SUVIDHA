import 'package:cdgi/home1.dart';
import 'package:cdgi/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Responsive variables
    double screenWidth = Get.width;
    double screenHeight = Get.height;
    bool isSmallScreen = screenWidth < 360;
    bool isLargeScreen = screenWidth > 600;

    // Responsive font sizes - matching login screen exactly
    double titleFontSize = screenWidth * 0.09;
    double subtitleFontSize = isSmallScreen
        ? screenWidth * 0.03
        : (isLargeScreen ? 16 : screenWidth * 0.035);
    double headerFontSize = isSmallScreen
        ? screenWidth * 0.06
        : (isLargeScreen ? 26 : screenWidth * 0.07); // Fixed to match login
    double bodyFontSize = isSmallScreen
        ? screenWidth * 0.035
        : (isLargeScreen ? 18 : screenWidth * 0.04);
    double buttonFontSize = isSmallScreen
        ? screenWidth * 0.04
        : (isLargeScreen ? 20 : screenWidth * 0.045);

    // Responsive padding and margins - matching login screen
    double horizontalPadding = isSmallScreen
        ? screenWidth * 0.06
        : (isLargeScreen ? 48 : screenWidth * 0.08);
    double buttonHeight = isSmallScreen
        ? screenHeight * 0.055
        : (isLargeScreen ? 56 : screenHeight * 0.06);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight:
                  screenHeight -
                  MediaQuery.of(context).padding.top -
                  MediaQuery.of(context).padding.bottom,
              maxWidth: isLargeScreen ? 600 : double.infinity,
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        // Top spacing - matching login screen
                        SizedBox(
                          height: isSmallScreen
                              ? screenHeight * 0.06
                              : screenHeight * 0.08,
                        ),

                        // SUVIDHA Logo and tagline
                        Column(
                          children: [
                            Text(
                              'SUVIDHA',
                              style: GoogleFonts.montserrat(
                                fontSize: titleFontSize,
                                fontWeight: FontWeight.bold,
                                letterSpacing: isSmallScreen ? 1.5 : 2,
                                foreground: Paint()
                                  ..shader =
                                      const LinearGradient(
                                        colors: [
                                          Color(0xFF468AFF),
                                          Color(0xFF8969FF),
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ).createShader(
                                        Rect.fromLTWH(
                                          0.0,
                                          0.0,
                                          screenWidth * 0.5,
                                          titleFontSize * 1.2,
                                        ),
                                      ),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.001),
                            Text(
                              'Your voice, always heard.',
                              style: GoogleFonts.montserrat(
                                fontSize: subtitleFontSize,
                                color: const Color(0xFF6B6B6B),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: screenHeight * 0.04),

                        // Create Account section
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Create an Account title
                            Text(
                              'Create an Account',
                              style: GoogleFonts.montserrat(
                                fontSize: headerFontSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.003),

                            // Get started today subtitle
                            Text(
                              'Get started today',
                              style: GoogleFonts.montserrat(
                                fontSize: bodyFontSize,
                                color: const Color(0xFF7D7D7D),
                                fontWeight: FontWeight.w400,
                              ),
                            ),

                            SizedBox(height: screenHeight * 0.03),

                            // Username field
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: isLargeScreen ? 400 : double.infinity,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: const Color(0xFF468AFF),
                                  width: 1.5,
                                ),
                              ),
                              child: TextField(
                                controller: _usernameController,
                                style: GoogleFonts.montserrat(
                                  fontSize: bodyFontSize,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Username',
                                  hintStyle: GoogleFonts.montserrat(
                                    color: Colors.grey[500],
                                    fontSize: bodyFontSize,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.04,
                                    vertical: isSmallScreen
                                        ? screenHeight * 0.015
                                        : screenHeight * 0.02,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: screenHeight * 0.01),

                            // Email field
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: isLargeScreen ? 400 : double.infinity,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey[300]!),
                              ),
                              child: TextField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                style: GoogleFonts.montserrat(
                                  fontSize: bodyFontSize,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Email Address',
                                  hintStyle: GoogleFonts.montserrat(
                                    color: Colors.grey[500],
                                    fontSize: bodyFontSize,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.04,
                                    vertical: isSmallScreen
                                        ? screenHeight * 0.015
                                        : screenHeight * 0.02,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: screenHeight * 0.01),

                            // Password field
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: isLargeScreen ? 400 : double.infinity,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey[300]!),
                              ),
                              child: TextField(
                                controller: _passwordController,
                                obscureText: true,
                                style: GoogleFonts.montserrat(
                                  fontSize: bodyFontSize,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: GoogleFonts.montserrat(
                                    color: Colors.grey[500],
                                    fontSize: bodyFontSize,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.04,
                                    vertical: isSmallScreen
                                        ? screenHeight * 0.015
                                        : screenHeight * 0.02,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: screenHeight * 0.01),

                            // Confirm Password field
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: isLargeScreen ? 400 : double.infinity,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey[300]!),
                              ),
                              child: TextField(
                                controller: _confirmPasswordController,
                                obscureText: true,
                                style: GoogleFonts.montserrat(
                                  fontSize: bodyFontSize,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Confirm password',
                                  hintStyle: GoogleFonts.montserrat(
                                    color: Colors.grey[500],
                                    fontSize: bodyFontSize,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.04,
                                    vertical: isSmallScreen
                                        ? screenHeight * 0.015
                                        : screenHeight * 0.02,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: screenHeight * 0.03),

                            // Sign Up button
                            SizedBox(
                              width: isLargeScreen ? 400 : double.infinity,
                              height: buttonHeight,
                              child: ElevatedButton(
                                onPressed: () {
                                  // TODO: Implement sign up logic
                                  Get.to(() => const Home1());
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF0074E7),
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  'Sign Up',
                                  style: GoogleFonts.montserrat(
                                    fontSize: buttonFontSize,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: isSmallScreen
                                  ? screenHeight * 0.025
                                  : screenHeight * 0.03,
                            ),

                            // Or continue with divider
                            SizedBox(
                              width: isLargeScreen ? 400 : double.infinity,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Divider(color: Colors.grey[300]),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: screenWidth * 0.04,
                                    ),
                                    child: Text(
                                      'or continue with',
                                      style: GoogleFonts.montserrat(
                                        fontSize: isSmallScreen
                                            ? screenWidth * 0.03
                                            : screenWidth * 0.035,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Divider(color: Colors.grey[300]),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: isSmallScreen
                                  ? screenHeight * 0.025
                                  : screenHeight * 0.03,
                            ),

                            // Sign in with Google button (Circular border)
                            SizedBox(
                              width: isLargeScreen ? 400 : double.infinity,
                              height: buttonHeight,
                              child: OutlinedButton.icon(
                                onPressed: () {
                                  // TODO: Implement Google sign up
                                },
                                icon: Image.asset(
                                  'assets/images/google_icon.png',
                                  width: isSmallScreen
                                      ? screenWidth * 0.045
                                      : screenWidth * 0.05,
                                  height: isSmallScreen
                                      ? screenWidth * 0.045
                                      : screenWidth * 0.05,
                                ),
                                label: Text(
                                  'Sign in with Google',
                                  style: GoogleFonts.montserrat(
                                    fontSize: bodyFontSize,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                  ),
                                ),
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: Colors.grey[300]!),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      screenHeight * 2,
                                    ), // Circular border
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // Bottom section
                    Column(
                      children: [
                        SizedBox(height: screenHeight * 0.01),

                        // Already have an account? Login
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Get.offAll(LoginScreen());
                            },
                            child: RichText(
                              text: TextSpan(
                                style: GoogleFonts.montserrat(
                                  fontSize: isSmallScreen
                                      ? screenWidth * 0.03
                                      : screenWidth * 0.035,
                                  color: Colors.black87,
                                ),
                                children: [
                                  const TextSpan(
                                    text: 'Already have an account? ',
                                  ),
                                  TextSpan(
                                    text: 'Login',
                                    style: GoogleFonts.montserrat(
                                      color: const Color(0xFF4285F4),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: isSmallScreen
                              ? screenHeight * 0.02
                              : screenHeight * 0.03,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
