import 'package:cdgi/home1.dart';
import 'package:cdgi/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'auth_functions.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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

  final form_key = GlobalKey<FormState>();
  String email = '';
  String pass = '';
  String confpass = '';

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  trysubmit() {
    final isvalid = form_key.currentState!.validate();
    if (isvalid) {
      form_key.currentState!.save();
      signup(email, pass, context); // Implemented in auth_functions.dart
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
                child: Form(
                  key: form_key,
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
                          SizedBox(height: screenHeight * 0.04),
                          Text(
                            'Create an Account',
                            style: GoogleFonts.montserrat(
                              fontSize: headerFontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.003),
                          Text(
                            'Get started today',
                            style: GoogleFonts.montserrat(
                              fontSize: bodyFontSize,
                              color: const Color(0xFF7D7D7D),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.03),

                          // ✅ Full Name (Not validated)
                          _buildTextField(
                            controller: _usernameController,
                            hint: 'Full name',
                            fontSize: bodyFontSize,
                          ),

                          SizedBox(height: screenHeight * 0.01),

                          // ✅ Email (Validation Added)
                          _buildTextFormField(
                            controller: _emailController,
                            hint: 'Email Address',
                            fontSize: bodyFontSize,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  !value.contains('@')) {
                                return 'Enter a valid email';
                              }
                              return null;
                            },
                            onSaved: (value) => email = value!,
                          ),

                          SizedBox(height: screenHeight * 0.01),

                          // ✅ Password
                          _buildTextFormField(
                            controller: _passwordController,
                            hint: 'Password',
                            fontSize: bodyFontSize,
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.length < 8) {
                                return 'Password must be at least 8 characters';
                              }
                              return null;
                            },
                            onSaved: (value) => pass = value!,
                          ),

                          SizedBox(height: screenHeight * 0.01),

                          // ✅ Confirm Password
                          _buildTextFormField(
                            controller: _confirmPasswordController,
                            hint: 'Confirm password',
                            fontSize: bodyFontSize,
                            obscureText: true,
                            validator: (value) {
                              if (value != _passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                            onSaved: (value) => confpass = value!,
                          ),

                          SizedBox(height: screenHeight * 0.03),

                          // ✅ Sign Up Button
                          SizedBox(
                            width: isLargeScreen ? 400 : double.infinity,
                            height: buttonHeight,
                            child: ElevatedButton(
                              onPressed: trysubmit,
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

                          SizedBox(height: screenHeight * 0.03),

                          // ✅ Google Sign-in Button
                          SizedBox(
                            width: isLargeScreen ? 400 : double.infinity,
                            height: buttonHeight,
                            child: OutlinedButton.icon(
                              onPressed: googlesignin,
                              icon: Image.asset(
                                'assets/images/google_icon.png',
                                width: screenWidth * 0.05,
                                height: screenWidth * 0.05,
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
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      TextButton(
                        onPressed: () => Get.offAll(LoginScreen()),
                        child: Text(
                          'Already have an account? Login',
                          style: GoogleFonts.montserrat(
                            fontSize: bodyFontSize,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required double fontSize,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: TextField(
        controller: controller,
        style: GoogleFonts.montserrat(fontSize: fontSize),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.montserrat(
            color: Colors.grey[500],
            fontSize: fontSize,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String hint,
    required double fontSize,
    bool obscureText = false,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    void Function(String?)? onSaved,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        onSaved: onSaved,
        style: GoogleFonts.montserrat(fontSize: fontSize),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.montserrat(
            color: Colors.grey[500],
            fontSize: fontSize,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
