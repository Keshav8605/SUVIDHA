import 'package:cdgi/home1.dart';
import 'package:cdgi/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'auth_functions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void googlesignin() async {
    final usercredential = await signInWithGoogle();
    if (usercredential != null) {
      final user = usercredential.user;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Signed in as ${user!.displayName}')),
      );
      Get.offAll(Home1());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Google sign-in cancelled or failed')),
      );
    }
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  /// ✅ Email/Password Sign-In Logic
  Future<void> emailPasswordSignIn() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter email and password')),
      );
      return;
    }

    try {
      await signin(email, password, context);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Login successful!')));
      Get.offAll(Home1());
    } catch (e) {
      // Error message is already shown inside signin()
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = Get.width;
    double screenHeight = Get.height;
    bool isSmallScreen = screenWidth < 360;
    bool isLargeScreen = screenWidth > 600;

    double titleFontSize = screenWidth * 0.09;
    double subtitleFontSize = isSmallScreen
        ? screenWidth * 0.03
        : (isLargeScreen ? 16 : screenWidth * 0.035);
    double headerFontSize = isSmallScreen
        ? screenWidth * 0.06
        : (isLargeScreen ? 26 : screenWidth * 0.07);
    double bodyFontSize = isSmallScreen
        ? screenWidth * 0.035
        : (isLargeScreen ? 18 : screenWidth * 0.04);
    double buttonFontSize = isSmallScreen
        ? screenWidth * 0.04
        : (isLargeScreen ? 20 : screenWidth * 0.045);

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
                        SizedBox(
                          height: isSmallScreen
                              ? screenHeight * 0.06
                              : screenHeight * 0.08,
                        ),
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
                              'your_voice_always_heard'.tr,
                              style: GoogleFonts.montserrat(
                                fontSize: subtitleFontSize,
                                color: const Color(0xFF6B6B6B),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: isSmallScreen
                              ? screenHeight * 0.06
                              : screenHeight * 0.08,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'welcome_back'.tr,
                              style: GoogleFonts.montserrat(
                                fontSize: headerFontSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.005),
                            Text(
                              'sign_in_to_continue'.tr,
                              style: GoogleFonts.montserrat(
                                fontSize: bodyFontSize,
                                color: const Color(0xFF7D7D7D),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: isSmallScreen
                                  ? screenHeight * 0.04
                                  : screenHeight * 0.05,
                            ),
                            // Email Field
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
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                style: GoogleFonts.montserrat(
                                  fontSize: bodyFontSize,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'email_address'.tr,
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
                            SizedBox(height: screenHeight * 0.02),
                            // Password Field
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
                                  hintText: 'password'.tr,
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
                            SizedBox(
                              height: isSmallScreen
                                  ? screenHeight * 0.03
                                  : screenHeight * 0.04,
                            ),
                            // ✅ Email/Password Sign-In Button
                            SizedBox(
                              width: isLargeScreen ? 400 : double.infinity,
                              height: buttonHeight,
                              child: ElevatedButton(
                                onPressed:
                                    emailPasswordSignIn, // <-- integrated here
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF0074E7),
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  'sign_in'.tr,
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
                            // OR Divider
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
                                      'or_continue_with'.tr,
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
                            // Google Sign-In Button
                            SizedBox(
                              width: isLargeScreen ? 400 : double.infinity,
                              height: buttonHeight,
                              child: OutlinedButton.icon(
                                onPressed: googlesignin,
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
                                  'sign_in_with_google'.tr,
                                  style: GoogleFonts.montserrat(
                                    fontSize: bodyFontSize,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                  ),
                                ),
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: Colors.grey[300]!),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: isSmallScreen
                              ? screenHeight * 0.04
                              : screenHeight * 0.06,
                        ),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Get.off(RegisterScreen());
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
                                  TextSpan(text: 'not_a_member_register'.tr),
                                  TextSpan(
                                    text: 'register'.tr,
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
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
