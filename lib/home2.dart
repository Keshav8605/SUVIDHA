import 'package:cdgi/viewmodels/issue_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class Home2 extends StatelessWidget {
  Home2({super.key});
  final IssueViewModel _issueViewModel = IssueViewModel();
  @override
  Widget build(BuildContext context) {
    // Responsive variables
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double sizeConfigW = screenWidth / 100;
    double sizeConfigH = screenHeight / 100;

    bool isSmallScreen = screenWidth < 360;
    bool isLargeScreen = screenWidth > 600;

    // Responsive font sizes
    double titleFontSize = isSmallScreen
        ? sizeConfigW * 5.5
        : (isLargeScreen ? sizeConfigW * 6.5 : sizeConfigW * 6);
    double bodyFontSize = isSmallScreen
        ? sizeConfigW * 4
        : (isLargeScreen ? sizeConfigW * 4.5 : sizeConfigW * 4.2);
    double smallTextSize = isSmallScreen
        ? sizeConfigW * 3.2
        : (isLargeScreen ? sizeConfigW * 3.8 : sizeConfigW * 3.5);
    double buttonTextSize = isSmallScreen
        ? sizeConfigW * 3.5
        : (isLargeScreen ? sizeConfigW * 4 : sizeConfigW * 3.8);

    // Responsive padding and sizes
    double horizontalPadding = isSmallScreen
        ? sizeConfigW * 5
        : (isLargeScreen ? sizeConfigW * 8 : sizeConfigW * 6);
    double micButtonSize = isSmallScreen
        ? sizeConfigW * 18
        : (isLargeScreen ? sizeConfigW * 20 : sizeConfigW * 19);

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black54),
          onPressed: () {
            Get.back();
          },
        ),
        leadingWidth: screenWidth * 0.08,
        flexibleSpace: null,
        title: Text(
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
                    Rect.fromLTWH(0.0, 0.0, 200.0, titleFontSize * 1.2),
                  ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: const Color(0xFF468AFF).withOpacity(0.1),
            height: 1.0,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: sizeConfigH * 3),

              // Welcome message
              Text(
                'Welcome to Suvidha!',
                style: GoogleFonts.montserrat(
                  fontSize: bodyFontSize,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),

              SizedBox(height: sizeConfigH * 1.5),

              // Description
              Text(
                'Your voice assistant for municipal services.',
                style: GoogleFonts.montserrat(
                  fontSize: smallTextSize,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF7D7D7D),
                ),
              ),

              SizedBox(height: sizeConfigH * 3),

              // Instructions
              Text(
                'Tap the mic & speak your request.',
                style: GoogleFonts.montserrat(
                  fontSize: smallTextSize,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                ),
              ),

              SizedBox(height: sizeConfigH * 1),

              // Example text
              RichText(
                text: TextSpan(
                  text: 'Example: ',
                  style: GoogleFonts.montserrat(
                    fontSize: smallTextSize,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                  children: [
                    TextSpan(
                      text: '"Report a pothole" or "Check tax status".',
                      style: GoogleFonts.montserrat(
                        fontSize: smallTextSize,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: sizeConfigH * 4),

              // Report a pothole button
              Align(
                alignment: Alignment.centerRight,
                child: Container(
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
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Handle report pothole action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: sizeConfigW * 6,
                        vertical: sizeConfigH * 1.5,
                      ),
                    ),
                    child: Text(
                      'Report a pothole',
                      style: GoogleFonts.montserrat(
                        fontSize: buttonTextSize,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              const Spacer(),

              // AI is thinking text
              Center(
                child: Text(
                  'AI is thinking...',
                  style: GoogleFonts.montserrat(
                    fontSize: smallTextSize,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF7D7D7D),
                  ),
                ),
              ),

              const Spacer(flex: 2),

              // Microphone button
              Center(
                child: Container(
                  width: micButtonSize,
                  height: micButtonSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF468AFF).withOpacity(0.3),
                      width: 2,
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF468AFF).withOpacity(0.1),
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(micButtonSize / 2),
                      onTap: () async {
                        final either = await _issueViewModel.createIssue(
                          "ss@g.com",
                          "sda",
                          "the light is not coming since 3 days, in scheme number 78 ashok nagar area, indore",
                        );
                        either.fold(
                          (l) {
                            print(l.message);
                            // emit(SignUpErrorState(l.message));
                          },
                          (r) {
                            print(r.description);
                            // emit(SignUpSuccess(r));
                          },
                        );
                      },
                      child: Container(
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: Icon(
                          Icons.mic,
                          size: micButtonSize * 0.4,
                          color: const Color(0xFF468AFF),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: sizeConfigH * 2),

              // Press and hold text
              Center(
                child: Text(
                  'Press and hold to speak',
                  style: GoogleFonts.montserrat(
                    fontSize: smallTextSize,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF7D7D7D),
                  ),
                ),
              ),

              SizedBox(height: sizeConfigH * 6),

              // Bottom navigation icons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: sizeConfigW * 12,
                    height: sizeConfigW * 12,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Icon(
                      Icons.calendar_today,
                      size: sizeConfigW * 6,
                      color: Colors.black54,
                    ),
                  ),
                  Container(
                    width: sizeConfigW * 12,
                    height: sizeConfigW * 12,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.3),
                        width: 1,
                      ),
                    ),
                    child: Icon(
                      Icons.settings,
                      size: sizeConfigW * 6,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),

              SizedBox(height: sizeConfigH * 3),
            ],
          ),
        ),
      ),
    );
  }
}
