import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/presentation/viewmodels/DataFetchController/test_result_controller.dart';

class NotificationServices {
  final FirebaseMessaging messaging = FirebaseMessaging.instance;

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidNotificationChannel _androidChannel =
      const AndroidNotificationChannel(
        'high_importance_channel',
        'High Importance Notifications',
        description: 'This channel is used for important notifications.',
        importance: Importance.high,
      );

  int badgeCount = 0;

  bool _isTestResultMessage(RemoteMessage message) {
    final type = (message.data['type'] ?? message.data['notificationType'] ?? '')
        .toString()
        .toLowerCase();
    return type == 'test' || type == 'test_result' || type == 'result' ||
        type == 'testresult' || message.data.containsKey('testId') ||
        message.data.containsKey('classId') && message.data.containsKey('scores');
  }

  void _refreshTestResultsIfNeeded(RemoteMessage message) {
    if (!_isTestResultMessage(message)) return;
    if (Get.isRegistered<TestResultController>()) {
      Get.find<TestResultController>().refreshResults();
    }
  }

  Future<void> requestNotificationPermission() async {
    final settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    print('Permission: ${settings.authorizationStatus}');
  }

  Future<void> initializeLocalNotifications() async {
    const androidInitializationSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    const initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      settings: initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        print('Notification clicked payload: ${response.payload}');
      },
    );
  }

  Future<void> setupFlutterNotifications() async {
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(_androidChannel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  void firebaseInit() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Foreground message received');
      print('Title: ${message.notification?.title}');
      print('Body: ${message.notification?.body}');

      showNotification(message);
      _refreshTestResultsIfNeeded(message);
    });
  }

  void setupInteractMessage() {
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        print('App opened from terminated notification');
        print('Data: ${message.data}');
        clearBadgeCount();
        _refreshTestResultsIfNeeded(message);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('App opened from background notification');
      print('Data: ${message.data}');
      clearBadgeCount();
      _refreshTestResultsIfNeeded(message);
    });
  }

  Future<void> showNotification(RemoteMessage message) async {
    final notification = message.notification;

    final title =
        notification?.title ??
        message.data['title']?.toString() ??
        'Notification';

    final body = notification?.body ?? message.data['body']?.toString() ?? '';

    badgeCount++;

    final androidNotificationDetails = AndroidNotificationDetails(
      _androidChannel.id,
      _androidChannel.name,
      channelDescription: _androidChannel.description,
      importance: Importance.high,
      priority: Priority.high,
      ticker: 'ticker',
      icon: '@drawable/ic_notification',
      number: badgeCount,
    );

    final notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    await _flutterLocalNotificationsPlugin.show(
      id: Random().nextInt(100000),
      title: title,
      body: body,
      notificationDetails: notificationDetails,
      payload: message.data.toString(),
    );
  }

  void clearBadgeCount() {
    badgeCount = 0;
  }

  Future<String> getDeviceToken() async {
    final token = await messaging.getToken();
    return token ?? '';
  }

  void isTokenRefresh() {
    messaging.onTokenRefresh.listen((newToken) async {
      print('New FCM Token: $newToken');
      await saveTokenToStudent(token: newToken);
    });
  }

  Future<void> saveTokenToStudent({String? token}) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final fcmToken = token ?? await getDeviceToken();
    if (fcmToken.isEmpty) return;

    await FirebaseFirestore.instance.collection('students').doc(user.uid).set({
      'fcmToken': fcmToken,
      'fcmTokenUpdatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));

    print('Token saved: $fcmToken');
  }
}
