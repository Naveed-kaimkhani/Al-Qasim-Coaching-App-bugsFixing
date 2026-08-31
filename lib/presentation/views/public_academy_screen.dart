import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

import 'package:qr_code_scanner/core/constants/app_colors.dart';
import 'package:qr_code_scanner/presentation/views/login_screen.dart';

class PublicAcademyScreen extends StatelessWidget {
  const PublicAcademyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 270.h,
            pinned: true,
            elevation: 0,
            backgroundColor: AppColors.warning,
            title: Text(
              'About Al-Qasim Academy',
              style: GoogleFonts.poppins(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: _buildHero(),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 32.h),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _sectionCard(
                  icon: LucideIcons.building2,
                  title: 'Welcome to Al-Qasim Academy of Mathematics',
                  child: _body(
                    'Al-Qasim Academy of Mathematics is a dedicated Mathematics learning centre based in Jhuddo, District Mirpurkhas, Sindh.\n\n'
                    'Our journey is built on a simple belief: every student can learn Mathematics when it is taught with clarity, understanding, and the right approach.\n\n'
                    'We focus on strong mathematical concepts, logical thinking, problem-solving skills, and confidence—not simply memorizing formulas for examinations.',
                  ),
                ),
                SizedBox(height: 16.h),
                _sectionCard(
                  icon: LucideIcons.graduationCap,
                  title: 'About Sir Danish Iqbal',
                  subtitle: 'Founder & Mathematics Educator',
                  child: _body(
                    'Sir Danish Iqbal has been teaching Mathematics since 2013. His teaching journey began in Hyderabad while pursuing B.E. in Chemical Engineering at Mehran University of Engineering & Technology (MUET) from 2011 to 2015.\n\n'
                    'After returning to Jhuddo, he continued teaching Mathematics individually while also working in the private sector. In 2019–2020, he left his private job to dedicate himself primarily to Mathematics education and academy teaching.\n\n'
                    'In 2022, he joined the Sindh Government as a Junior Elementary School Teacher (JEST), while continuing his commitment to Mathematics education through his academy.',
                  ),
                  footer: _qualifications(),
                ),
                SizedBox(height: 16.h),
                _sectionCard(
                  icon: LucideIcons.lightbulb,
                  title: 'Our Philosophy',
                  child: _body(
                    'Mathematics is more than a subject. We believe Mathematics is a language that helps us understand how the world works.\n\n'
                    'Our aim is to help students understand why Mathematics works, not simply memorize how to solve a question. We encourage students to connect Mathematics with real-life situations, develop logical and analytical thinking, and solve problems with confidence.',
                  ),
                  footer: Container(
                    padding: EdgeInsets.all(14.w),
                    decoration: BoxDecoration(
                      color: AppColors.warning.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: _body(
                      'Our vision: To help every student discover their potential and become extraordinary in Mathematics.',
                      weight: FontWeight.w600,
                      color: AppColors.warningDarker,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                _sectionCard(
                  icon: LucideIcons.bookOpen,
                  title: 'What We Teach',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _label('School Mathematics'),
                      _bullet('Class IX'),
                      _bullet('Class X'),
                      _bullet('Class XI'),
                      _bullet('Class XII'),
                      SizedBox(height: 12.h),
                      _label('University Mathematics'),
                      SizedBox(height: 4.h),
                      _body('Online Mathematics classes are also available for university students according to their academic requirements.'),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                _sectionCard(
                  icon: LucideIcons.calendarClock,
                  title: 'Class Timetable',
                  child: Column(
                    children: [
                      _scheduleRow('2:30 PM – 3:15 PM', 'Class XI'),
                      _scheduleRow('3:15 PM – 4:10 PM', 'Class XII'),
                      _scheduleRow('4:15 PM – 5:15 PM', 'Class IX — Girls'),
                      _scheduleRow('5:15 PM – 6:15 PM', 'Class X — Girls'),
                      _scheduleRow('6:15 PM – 7:15 PM', 'Class IX — Boys'),
                      _scheduleRow('7:15 PM – 8:15 PM', 'Class X — Boys'),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                _sectionCard(
                  icon: LucideIcons.users,
                  title: 'Parent Portal',
                  subtitle: "Stay connected with your child's progress",
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _body('After logging in, parents can access:'),
                      SizedBox(height: 10.h),
                      ...[
                        'Attendance Record',
                        'Test Results',
                        'Fee Record',
                        'Upcoming Tests',
                        'Academic Performance',
                        'Academy Announcements',
                      ].map(_checkItem),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                _sectionCard(
                  icon: LucideIcons.share2,
                  title: 'Connect With Us',
                  child: _body(
                    'Follow Al-Qasim Academy of Mathematics for Mathematics lessons, educational content, examination preparation, announcements, and academy updates.\n\n'
                    'Instagram: @alqasimacadmey290\n'
                    'YouTube: @Al-QasimAcademyofMathematics',
                  ),
                ),
                SizedBox(height: 24.h),
                SizedBox(
                  width: double.infinity,
                  height: 54.h,
                  child: ElevatedButton.icon(
                    onPressed: () => Get.offAll(() => LoginScreen()),
                    icon: Icon(LucideIcons.logIn, size: 19.sp),
                    label: Text(
                      'Login',
                      style: GoogleFonts.poppins(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.warning,
                      foregroundColor: Colors.white,
                      elevation: 4,
                      shadowColor: AppColors.warning.withOpacity(0.35),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Center(child: _body('Login to view your child\'s academic information.', fontSize: 11.sp)),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHero() {
    return Container(
      padding: EdgeInsets.fromLTRB(24.w, 82.h, 24.w, 28.h),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFF39C12), Color(0xFFE67E22), Color(0xFFD35400)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70.w,
            height: 70.w,
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Image.asset('assets/app_logo.png', fit: BoxFit.contain),
          ),
          SizedBox(height: 14.h),
          Text(
            'Al-Qasim Academy of Mathematics',
            style: GoogleFonts.poppins(
              fontSize: 24.sp,
              height: 1.15,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            'The Language of the Universe',
            style: GoogleFonts.poppins(
              fontSize: 13.sp,
              fontStyle: FontStyle.italic,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionCard({
    required IconData icon,
    required String title,
    String? subtitle,
    required Widget child,
    Widget? footer,
  }) {
    return Container(
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: AppColors.warning.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(icon, color: AppColors.warningDarker, size: 20.sp),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                    if (subtitle != null) ...[
                      SizedBox(height: 3.h),
                      Text(subtitle, style: GoogleFonts.poppins(fontSize: 11.sp, color: AppColors.warningDarker, fontWeight: FontWeight.w600)),
                    ],
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 14.h),
          child,
          if (footer != null) ...[SizedBox(height: 14.h), footer],
        ],
      ),
    );
  }

  Widget _qualifications() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label('Qualifications'),
        _bullet('B.E. Chemical Engineering — MUET'),
        _bullet('B.Ed.'),
        _bullet('M.Ed.'),
        _bullet('Mathematics teaching experience since 2013'),
        _bullet('JEST — Government of Sindh'),
      ],
    );
  }

  Widget _scheduleRow(String time, String className) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.shade200))),
      child: Row(
        children: [
          SizedBox(width: 118.w, child: Text(time, style: GoogleFonts.poppins(fontSize: 11.sp, color: AppColors.textSecondary, fontWeight: FontWeight.w600))),
          Expanded(child: Text(className, style: GoogleFonts.poppins(fontSize: 12.sp, color: AppColors.textPrimary, fontWeight: FontWeight.w600))),
        ],
      ),
    );
  }

  Widget _checkItem(String text) => _bullet(text, icon: LucideIcons.circleCheck);

  Widget _bullet(String text, {IconData icon = LucideIcons.check}) {
    return Padding(
      padding: EdgeInsets.only(top: 7.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 15.sp, color: AppColors.success),
          SizedBox(width: 8.w),
          Expanded(child: _body(text)),
        ],
      ),
    );
  }

  Widget _label(String text) => Text(text, style: GoogleFonts.poppins(fontSize: 13.sp, fontWeight: FontWeight.w700, color: AppColors.textPrimary));

  Widget _body(String text, {Color? color, FontWeight? weight, double? fontSize}) {
    return Text(text, style: GoogleFonts.poppins(fontSize: fontSize ?? 12.sp, height: 1.65, color: color ?? AppColors.textSecondary, fontWeight: weight));
  }
}
