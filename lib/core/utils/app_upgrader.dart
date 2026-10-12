import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';

/// Configuration and shared instance manager for [Upgrader].
class AppUpgrader {
  static Upgrader? _instance;

  /// Returns the configured singleton [Upgrader] instance.
  static Upgrader get instance {
    _instance ??= Upgrader(
      // How often to prompt again if the user taps "Later"
      durationUntilAlertAgain: const Duration(days: 1),
      // Check for updates when the app comes back to the foreground
      checkOnResume: true,
      // Print logs in debug mode to trace version checking
      debugLogging: kDebugMode,
      // Uncomment `debugDisplayAlways: true` during testing to force the alert dialog to show
      // debugDisplayAlways: true,
    );
    return _instance!;
  }
}

/// A reusable widget that wraps a screen with [UpgradeAlert] using
/// custom settings suitable for Play Store version checks.
class AppUpgradeAlert extends StatelessWidget {
  final Widget child;

  const AppUpgradeAlert({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      upgrader: AppUpgrader.instance,
      dialogStyle: UpgradeDialogStyle.material,
      barrierDismissible: false,
      showIgnore: false,
      showLater: true,
      showReleaseNotes: true,
      child: child,
    );
  }
}
