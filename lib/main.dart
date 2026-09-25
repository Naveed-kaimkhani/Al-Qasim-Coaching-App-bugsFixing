

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toastification/toastification.dart';

import 'firebase_options.dart';
import 'notification_services.dart';
import 'presentation/bindings/qr_binding.dart';
import 'presentation/views/splash_screen.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(
  RemoteMessage message,
) async {
  await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,
  );

  // print('BACKGROUND NOTIFICATION');
  // print('TITLE: ${message.notification?.title}');
  // print('BODY: ${message.notification?.body}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool firebaseInitialized = false;
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseMessaging.onBackgroundMessage(
      firebaseMessagingBackgroundHandler,
    );
    firebaseInitialized = true;
  } catch (e) {
    debugPrint('Firebase initialization failed: $e');
  }

  runApp(const MyApp());

  // Initialize notification services asynchronously after runApp so we don't block the app startup/splash screen
  if (firebaseInitialized) {
    _initNotificationServices();
  }
}

void _initNotificationServices() async {
  try {
    final notificationServices = NotificationServices();

    await notificationServices.requestNotificationPermission();
    await notificationServices.initializeLocalNotifications();
    await notificationServices.setupFlutterNotifications();

    notificationServices.firebaseInit();
    notificationServices.setupInteractMessage();
    notificationServices.isTokenRefresh();

    final token = await notificationServices.getDeviceToken();
    print('FCM TOKEN: $token');
    await notificationServices.saveTokenToStudent(token: token);
  } catch (e) {
    print('Error initializing notification services: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return ToastificationWrapper(
          child: GetMaterialApp(
            title: 'Al Qasim',
            debugShowCheckedModeBanner: false,
            initialBinding: QrBinding(),
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFFF39C12),
                primary: const Color(0xFFF39C12),
                secondary: const Color(0xFF27AE60),
                tertiary: const Color(0xFF2ECC71),
                surface: const Color(0xFFF8F9FA),
                background: const Color(0xFFF8F9FA),
              ),
              textTheme: GoogleFonts.poppinsTextTheme(),
            ),
            
            home: SplashScreen(),
          ),
        );
      },
    );
  }
}