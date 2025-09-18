import 'package:cdgi/start_screen1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'language_controller.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguageSelectionScreen extends StatelessWidget {
  final LanguageController languageController = Get.find<LanguageController>();

  // Language options with their display names and codes
  final List<Map<String, String>> languages = [
    {'name': 'English', 'code': 'en'},
    {'name': 'हिन्दी', 'code': 'hi'},
    {'name': 'বাংলা', 'code': 'bn'},
    {'name': 'తెలుగు', 'code': 'te'},
    {'name': 'தமிழ்', 'code': 'ta'},
    {'name': 'मराठी', 'code': 'mr'},
  ];

  LanguageSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double sizeConfigH = screenHeight / 100;

    double titleFontSize = sizeConfigH * 4;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 60),

              // SUVIDHA Title
              Text(
                'SUVIDHA',
                style: GoogleFonts.montserrat(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.w600,
                  foreground: Paint()
                    ..shader =
                        const LinearGradient(
                          colors: [Color(0xFF468AFF), Color(0xFF8969FF)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ).createShader(
                          Rect.fromLTWH(0.0, 0.0, 300.0, titleFontSize * 1.2),
                        ),
                ),
              ),

              const SizedBox(height: 80),

              Text(
                'choose_your_language'.tr,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF333333),
                ),
              ),

              const SizedBox(height: 40),

              // Language buttons grid
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.5,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    final language = languages[index];
                    return Obx(
                      () => LanguageButton(
                        text: language['name']!,
                        isSelected:
                            languageController.selectedLanguage.value ==
                            language['name'],
                        onTap: () {
                          languageController.setLanguage(
                            language['name']!,
                            language['code']!,
                          );

                          // Navigate to next screen after a short delay
                          Future.delayed(const Duration(milliseconds: 300), () {
                            Get.to(() => StartScreen1());
                          });
                        },
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class LanguageButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const LanguageButton({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF468AFF) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFF468AFF) : Colors.grey.shade300,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.montserrat(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
