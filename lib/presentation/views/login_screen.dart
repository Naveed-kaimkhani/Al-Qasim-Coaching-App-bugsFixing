

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:qr_code_scanner/components/login_appLogo.dart';
// import 'package:qr_code_scanner/components/login_background_elements.dart';
// import 'package:qr_code_scanner/components/login_title_section.dart';
// import 'package:qr_code_scanner/components/primary_button.dart';
// import 'package:qr_code_scanner/components/primary_input_field.dart';
// import 'package:qr_code_scanner/core/constants/app_colors.dart';
// import 'package:qr_code_scanner/presentation/bindings/home_binding.dart';
// import 'package:qr_code_scanner/presentation/viewmodels/auth_controller.dart';
// import 'package:lucide_flutter/lucide_flutter.dart';


// class LoginScreen extends StatelessWidget {
//   LoginScreen({super.key});
  
//   final RxBool isPasswordVisible = false.obs;
//   // final AuthController controller = Get.put(AuthController(Get.find()));
//     final AuthController controller =
//       Get.put(AuthController());

//   // Form key
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color(0xFFFFFFFF),
//               Color(0xFFFFF9E6),
//               Color(0xFFFFF3E0),
//             ],
//           ),
//         ),
//         child: Stack(
//           children: [
//             const BackgroundElements(),
//             Center(
//               child: SingleChildScrollView(
//                 padding: EdgeInsets.symmetric(horizontal: 28.w),
//                 child: Form(
//                   key: _formKey, // ✅ Form key
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       SizedBox(height: 80.h),
//                       const LoginAppLogo(),
//                       SizedBox(height: 24.h),
//                       const TitleSection(),
//                       SizedBox(height: 32.h),

//                       // Email Field
//                       // PrimaryInputField(
//                       //   hint: 'Student Email',
//                       //   prefixIcon: LucideIcons.user,
//                       //   keyboardType: TextInputType.emailAddress,
//                       //   onChanged: (value) => controller.email.value = value.trim(),
//                       //   validator: (value) {
//                       //     if (value == null || value.isEmpty) {
//                       //       return 'Please enter your Roll Number';
//                       //     }
//                       //     // Simple email regex
                         
//                       //     return null;
//                       //   },
//                       // ),

// //                       PrimaryInputField(
// //   hint: 'Student Email',
// //   prefixIcon: LucideIcons.user,
// //   keyboardType: TextInputType.emailAddress,
// //   onChanged: (value) => controller.email.value = value.trim(),
// //   validator: (value) {
// //     if (value == null || value.isEmpty) {
// //       return 'Please enter your email';
// //     }
// //     if (!GetUtils.isEmail(value)) {
// //       return 'Please enter valid email';
// //     }
// //     return null;
// //   },
// // ),

// // PrimaryInputField(
// //   controller: controller.emailController,
// //   hint: 'Student Email',
// //   prefixIcon: LucideIcons.user,
// //   keyboardType: TextInputType.emailAddress,
// // ),

// Obx(() => PrimaryInputField(
  
//   controller: controller.emailController,
//   hint: 'Student Email',
//   prefixIcon: LucideIcons.user,
//   keyboardType: TextInputType.emailAddress,
//   errorText: controller.emailError.value,
//   onChanged: (_) => controller.emailError.value = null,
// )),

//                       SizedBox(height: 16.h),


//             Obx(() => PrimaryInputField(
//   controller: controller.passwordController,
//   hint: 'Password',
//   prefixIcon: LucideIcons.lock,
//   obscureText: !isPasswordVisible.value,
//   errorText: controller.passwordError.value,
//   onChanged: (_) => controller.passwordError.value = null,
//   suffixIcon: IconButton(
//     icon: Icon(
//       isPasswordVisible.value ? Icons.visibility_off : Icons.visibility,
//       size: 18.sp,
//       color: Colors.grey,
//     ),
//     onPressed: () => isPasswordVisible.toggle(),
//   ),
// )),        
//                       // Obx(() => 
                      
// //                       PrimaryInputField(
// //                         controller: controller.passwordController,
// //   hint: 'Password',
// //   prefixIcon: LucideIcons.lock,
// //   obscureText: !isPasswordVisible.value,
// //   onChanged: (value) => controller.password.value = value.trim(),
// //   validator: (value) {
// //     if (value == null || value.isEmpty) {
// //       return 'Please enter your password';
// //     }
// //     if (value.length < 6) {
// //       return 'Password must be at least 6 characters';
// //     }
// //     return null;
// //   },
// //   suffixIcon: IconButton(
// //     icon: Icon(
// //       isPasswordVisible.value ? Icons.visibility_off : Icons.visibility,
// //       size: 18.sp,
// //       color: Colors.grey,
// //     ),
// //     onPressed: () => isPasswordVisible.toggle(),
// //   ),
// // )),




//                       SizedBox(height: 28.h),

//                       // Login Button
//                       // Obx(() => PrimaryButton(
//                       //   text: 'Login',
//                       //   gradient: AppColors.warningGradient,
//                       //   isLoading: controller.isLoading.value,
//                       //   onPressed: () {
//                       //     // if (_formKey.currentState!.validate()) {
//                       //     //   controller.login();
//                       //     // }
//                       //     Get.offAll(() =>  StudentDashboard());
//                       //   },
//                       // )),
//                       Obx(() => PrimaryButton(
//   text: 'Login',
//   gradient: AppColors.warningGradient,
//   isLoading: controller.isLoading.value,
//   onPressed: () {
//     // if (_formKey.currentState!.validate()) {
//     //   controller.login();
//     // }
//       controller.login();
//   },
// )),

//                       SizedBox(height: 24.h),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lucide_flutter/lucide_flutter.dart';

import 'package:qr_code_scanner/components/login_appLogo.dart';
import 'package:qr_code_scanner/components/login_background_elements.dart';
import 'package:qr_code_scanner/components/login_title_section.dart';
import 'package:qr_code_scanner/components/primary_button.dart';
import 'package:qr_code_scanner/components/primary_input_field.dart';
import 'package:qr_code_scanner/core/constants/app_colors.dart';
import 'package:qr_code_scanner/presentation/viewmodels/auth_controller.dart';
import 'package:qr_code_scanner/presentation/views/public_academy_screen.dart';
import 'package:qr_code_scanner/presentation/views/timetable_screen.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final RxBool isPasswordVisible = false.obs;

  final AuthController controller = Get.put(AuthController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFFFF9E6),
              Color(0xFFFFF3E0),
            ],
          ),
        ),
        child: Stack(
          children: [
            const BackgroundElements(),

            Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 28.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 80.h),

                      // App Logo
                      const LoginAppLogo(),

                      SizedBox(height: 24.h),

                      // Title
                      const TitleSection(),

                      SizedBox(height: 32.h),

                      // Email Field
                      Obx(
                        () => PrimaryInputField(
                          controller: controller.emailController,
                          hint: 'Student Email',
                          prefixIcon: LucideIcons.user,
                          keyboardType: TextInputType.emailAddress,
                          errorText: controller.emailError.value,
                          onChanged: (_) {
                            controller.emailError.value = null;
                          },
                        ),
                      ),

                      SizedBox(height: 16.h),

                      // Password Field
                      Obx(
                        () => PrimaryInputField(
                          controller: controller.passwordController,
                          hint: 'Password',
                          prefixIcon: LucideIcons.lock,
                          obscureText: !isPasswordVisible.value,
                          errorText: controller.passwordError.value,
                          onChanged: (_) {
                            controller.passwordError.value = null;
                          },
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPasswordVisible.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              size: 18.sp,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              isPasswordVisible.toggle();
                            },
                          ),
                        ),
                      ),

                      SizedBox(height: 28.h),

                      // Login Button
                      Obx(
                        () => PrimaryButton(
                          text: 'Login',
                          gradient: AppColors.warningGradient,
                          isLoading: controller.isLoading.value,
                          onPressed: () {
                            controller.login();
                          },
                        ),
                      ),

                      SizedBox(height: 14.h),

                      // Public Academy Button
                      SizedBox(
                        width: double.infinity,
                        height: 52.h,
                        child: OutlinedButton.icon(
                          onPressed: () {
                            Get.to(
                              () => const PublicAcademyScreen(),
                            );
                          },
                          icon: Icon(
                            LucideIcons.info,
                            size: 19.sp,
                          ),
                          label: Text(
                            'Explore Al-Qasim Academy',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.warningDarker,
                            side: BorderSide(
                              color: AppColors.warning.withOpacity(0.6),
                              width: 1.5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 12.h),

                      // View Timetable Button
                      SizedBox(
                        width: double.infinity,
                        height: 52.h,
                        child: TextButton.icon(
                          onPressed: () {
                            Get.to(() => const TimetableScreen());
                          },
                          icon: Icon(
                            LucideIcons.calendar,
                            size: 19.sp,
                          ),
                          label: Text(
                            'View Class Timetable',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            foregroundColor: AppColors.primaryDark,
                            backgroundColor: AppColors.primary.withOpacity(0.1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 12.h),

                      // Public access text
                      Text(
                        'No login required for these options',
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: AppColors.textSecondary,
                        ),
                      ),

                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}