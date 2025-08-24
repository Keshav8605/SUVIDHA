import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cdgi/services/issue_service.dart';
import 'package:cdgi/models/issue_model.dart';

class MyIssuesPage extends StatefulWidget {
  const MyIssuesPage({super.key});

  @override
  State<MyIssuesPage> createState() => _MyIssuesPageState();
}

class _MyIssuesPageState extends State<MyIssuesPage> {
  final IssueService _issueService = IssueService();
  List<IssueModel> _issues = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadUserIssues();
  }

  Future<void> _loadUserIssues() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      final User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser == null) {
        setState(() {
          _error = 'User not authenticated';
          _isLoading = false;
        });
        return;
      }

      final issues = await _issueService.getIssuesByUser(
        currentUser.email ?? "unknown@example.com",
      );

      setState(() {
        _issues = issues;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        print(e.toString());
        _error = 'Failed to load issues: $e';
        _isLoading = false;
      });
    }
  }

  Future<void> _refreshIssues() async {
    await _loadUserIssues();
  }

  @override
  Widget build(BuildContext context) {
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

    // Responsive padding
    double horizontalPadding = isSmallScreen
        ? sizeConfigW * 5
        : (isLargeScreen ? sizeConfigW * 8 : sizeConfigW * 6);

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black54),
          onPressed: () => Get.back(),
        ),
        leadingWidth: screenWidth * 0.08,
        title: Text(
          'MY ISSUES',
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
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Color(0xFF468AFF)),
            onPressed: _refreshIssues,
          ),
        ],
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

              // Header section
              Text(
                'Your Submitted Issues',
                style: GoogleFonts.montserrat(
                  fontSize: bodyFontSize,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),

              SizedBox(height: sizeConfigH * 1),

              Text(
                'Track the status of your municipal service requests.',
                style: GoogleFonts.montserrat(
                  fontSize: smallTextSize,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF7D7D7D),
                ),
              ),

              SizedBox(height: sizeConfigH * 3),

              // Content section
              Expanded(
                child: _buildContent(
                  sizeConfigW,
                  sizeConfigH,
                  smallTextSize,
                  bodyFontSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(
    double sizeConfigW,
    double sizeConfigH,
    double smallTextSize,
    double bodyFontSize,
  ) {
    if (_isLoading) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: sizeConfigW * 16,
              height: sizeConfigW * 16,
              decoration: BoxDecoration(
                color: const Color(0xFF468AFF).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SizedBox(
                  width: sizeConfigW * 8,
                  height: sizeConfigW * 8,
                  child: const CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0xFF468AFF),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: sizeConfigH * 2),
            Text(
              'Loading your issues...',
              style: GoogleFonts.montserrat(
                fontSize: smallTextSize,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF7D7D7D),
              ),
            ),
          ],
        ),
      );
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: sizeConfigW * 16,
              height: sizeConfigW * 16,
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.error_outline,
                color: Colors.red,
                size: sizeConfigW * 8,
              ),
            ),
            SizedBox(height: sizeConfigH * 2),
            Text(
              'Error',
              style: GoogleFonts.montserrat(
                fontSize: bodyFontSize,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: sizeConfigH * 1),
            Text(
              _error!,
              style: GoogleFonts.montserrat(
                fontSize: smallTextSize,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF7D7D7D),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: sizeConfigH * 3),
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF468AFF), Color(0xFF8969FF)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ElevatedButton(
                onPressed: _refreshIssues,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: sizeConfigW * 6,
                    vertical: sizeConfigH * 1.5,
                  ),
                ),
                child: Text(
                  'Try Again',
                  style: GoogleFonts.montserrat(
                    fontSize: smallTextSize,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    if (_issues.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: sizeConfigW * 20,
              height: sizeConfigW * 20,
              decoration: BoxDecoration(
                color: const Color(0xFF468AFF).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.inbox_outlined,
                color: const Color(0xFF468AFF),
                size: sizeConfigW * 10,
              ),
            ),
            SizedBox(height: sizeConfigH * 3),
            Text(
              'No Issues Found',
              style: GoogleFonts.montserrat(
                fontSize: bodyFontSize,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: sizeConfigH * 1),
            Text(
              'You haven\'t submitted any issues yet.\nStart by reporting your first concern!',
              style: GoogleFonts.montserrat(
                fontSize: smallTextSize,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF7D7D7D),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }
    var reversed = _issues.reversed;
    return RefreshIndicator(
      onRefresh: _refreshIssues,
      color: const Color(0xFF468AFF),
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: reversed.length,
        itemBuilder: (context, index) {
          final issue = reversed.elementAt(index);
          return _buildIssueCard(
            issue,
            sizeConfigW,
            sizeConfigH,
            smallTextSize,
            bodyFontSize,
          );
        },
      ),
    );
  }

  Widget _buildIssueCard(
    IssueModel issue,
    double sizeConfigW,
    double sizeConfigH,
    double smallTextSize,
    double bodyFontSize,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: sizeConfigH * 2),
      padding: EdgeInsets.all(sizeConfigW * 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF468AFF).withOpacity(0.1),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  issue.title ?? 'Voice Report',
                  style: GoogleFonts.montserrat(
                    fontSize: bodyFontSize,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: sizeConfigW * 3,
                  vertical: sizeConfigH * 0.5,
                ),
                decoration: BoxDecoration(
                  color: _getStatusColor(issue.status).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  issue.status?.toUpperCase() ?? 'PENDING',
                  style: GoogleFonts.montserrat(
                    fontSize: smallTextSize * 0.9,
                    fontWeight: FontWeight.w500,
                    color: _getStatusColor(issue.status),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: sizeConfigH * 1),

          // Issue description
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: sizeConfigW * 2.5,
                  vertical: sizeConfigH * 0.3,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF468AFF).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  issue.category ?? 'Unknown Category',
                  style: GoogleFonts.montserrat(
                    fontSize: smallTextSize * 0.85,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF468AFF),
                  ),
                ),
              ),
              SizedBox(width: sizeConfigW * 2),
              Expanded(
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: smallTextSize,
                      color: const Color(0xFF7D7D7D),
                    ),
                    SizedBox(width: sizeConfigW * 1),
                    Expanded(
                      child: Text(
                        issue.address ?? 'Unknown Address',
                        style: GoogleFonts.montserrat(
                          fontSize: smallTextSize * 0.9,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF7D7D7D),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: sizeConfigH * 1),

          // Issue description
          Container(
            padding: EdgeInsets.all(sizeConfigW * 3),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F9FA),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              issue.description ?? 'No description available',
              style: GoogleFonts.montserrat(
                fontSize: smallTextSize,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
                height: 1.4,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          SizedBox(height: sizeConfigH * 1.5),

          // Footer with date and ID
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    size: smallTextSize,
                    color: const Color(0xFF7D7D7D),
                  ),
                  SizedBox(width: sizeConfigW * 1),
                  Text(
                    _formatDate(issue.createdAt),
                    style: GoogleFonts.montserrat(
                      fontSize: smallTextSize * 0.9,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF7D7D7D),
                    ),
                  ),
                ],
              ),
              Text(
                'ID: ${issue.ticketId.length > 8 ? issue.ticketId.substring(0, 8) : issue.ticketId}...',
                style: GoogleFonts.montserrat(
                  fontSize: smallTextSize * 0.9,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF7D7D7D),
                ),
              ),
            ],
          ),

          // Issue count if greater than 1
          if (issue.issueCount > 1) ...[
            SizedBox(height: sizeConfigH * 1),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: sizeConfigW * 2.5,
                vertical: sizeConfigH * 0.5,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFFF9800).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.group_outlined,
                    size: smallTextSize,
                    color: const Color(0xFFFF9800),
                  ),
                  SizedBox(width: sizeConfigW * 1),
                  Text(
                    '${issue.issueCount} similar reports',
                    style: GoogleFonts.montserrat(
                      fontSize: smallTextSize * 0.85,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFFFF9800),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Color _getStatusColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'completed':
      case 'resolved':
        return const Color(0xFF4CAF50);
      case 'in_progress':
      case 'processing':
        return const Color(0xFF468AFF);
      case 'rejected':
      case 'cancelled':
        return Colors.red;
      default:
        return const Color(0xFFFF9800);
    }
  }

  String _formatDate(String createdAt) {
    try {
      final date = DateTime.parse(createdAt);
      final now = DateTime.now();
      final difference = now.difference(date);

      if (difference.inDays > 0) {
        return '${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago';
      } else if (difference.inHours > 0) {
        return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago';
      } else if (difference.inMinutes > 0) {
        return '${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago';
      } else {
        return 'Just now';
      }
    } catch (e) {
      return 'Unknown date';
    }
  }
}
