import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lucide_flutter/lucide_flutter.dart';
import 'package:qr_code_scanner/core/constants/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft, color: AppColors.textPrimary),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Class Timetable',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFFFFF), Color(0xFFFFF9E6), Color(0xFFFFF3E0)],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Header section
                Icon(
                  LucideIcons.graduationCap,
                  size: 48.sp,
                  color: AppColors.primary,
                ),
                SizedBox(height: 16.h),
                Text(
                  'AL-QASIM ACADEMY OF MATHEMATICS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryDark,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  '"The Language of The Universe"',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontStyle: FontStyle.italic,
                    color: AppColors.textSecondary,
                  ),
                ),
                SizedBox(height: 32.h),

                // Timetable Card
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    border: Border.all(color: AppColors.borderLight),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.r),
                            topRight: Radius.circular(16.r),
                          ),
                        ),
                        child: Text(
                          'CLASS TIME TABLE',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      _buildTableRow(
                        'Class',
                        'Timing',
                        'Eligibility',
                        isHeader: true,
                      ),
                      _buildTableRow(
                        'First Year (XI)',
                        '2:00 pm - 3:00 pm',
                        'Boys & Girls',
                      ),
                      _buildTableRow(
                        'Second Year (XII)',
                        '3:00 pm - 4:00 pm',
                        'Boys & Girls',
                      ),
                      _buildTableRow(
                        'Ninth Class (IX)',
                        '4:15 pm - 5:15 pm',
                        'Girls only',
                      ),
                      _buildTableRow(
                        'Matric Class (X)',
                        '5:15 pm - 6:15 pm',
                        'Girls only',
                      ),
                      _buildTableRow(
                        'Ninth Class (IX)',
                        '6:15 pm - 7:15 pm',
                        'Boys only',
                      ),
                      _buildTableRow(
                        'Matric Class (X)',
                        '7:15 pm - 8:15 pm',
                        'Boys only',
                        isLast: true,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 32.h),

                // Contact Section
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Contact Us',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                _buildContactItem(LucideIcons.phone, 'Phone', '0308-3580290'),
                _buildContactItem(
                  LucideIcons.messageCircle,
                  'WhatsApp',
                  '0308-3580290',
                ),

                SizedBox(height: 24.h),

                // Follow Us Section
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Follow Us',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),

                _buildSocialItem(
                  Icons.play_circle_outline,
                  'YouTube',
                  '@al-qasimacademyofmathematics',
                  'https://youtube.com/@al-qasimacademyofmathematics?si=LAWeWFErwbGMu0VN',
                ),
                _buildSocialItem(
                  Icons.facebook,
                  'Facebook',
                  'Al-Qasim Academy',
                  'https://www.facebook.com/share/1ButFkodPr/', // Replace with exact URL if different
                ),
                _buildSocialItem(
                  Icons.camera_alt_outlined,
                  'Instagram',
                  '@alqasimacadmey290',
                  'https://www.instagram.com/alqasimacadmey290?stkn=YWZjNWc0NDkwcGdz',
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTableRow(
    String className,
    String timing,
    String eligibility, {
    bool isHeader = false,
    bool isLast = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isHeader ? AppColors.primary.withOpacity(0.1) : Colors.white,
        border: Border(
          bottom: isLast
              ? BorderSide.none
              : BorderSide(color: AppColors.borderLight),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              className,
              style: TextStyle(
                fontSize: isHeader ? 14.sp : 13.sp,
                fontWeight: isHeader ? FontWeight.bold : FontWeight.w500,
                color: isHeader ? AppColors.primaryDark : AppColors.textPrimary,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              timing,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: isHeader ? 14.sp : 13.sp,
                fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
                color: isHeader
                    ? AppColors.primaryDark
                    : AppColors.warningDarker,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              eligibility,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: isHeader ? 14.sp : 13.sp,
                fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
                color: isHeader
                    ? AppColors.primaryDark
                    : AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String title, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(icon, size: 20.sp, color: AppColors.primary),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.textSecondary,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialItem(
    IconData icon,
    String platform,
    String handle,
    String url,
  ) {
    return InkWell(
      onTap: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      },
      borderRadius: BorderRadius.circular(8.r),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(icon, size: 20.sp, color: Colors.black87),
            ),
            SizedBox(width: 12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  platform,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.textSecondary,
                  ),
                ),
                Text(
                  handle,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
