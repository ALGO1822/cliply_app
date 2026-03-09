import 'package:flutter_accessibility_service/flutter_accessibility_service.dart';

abstract class AccessibilityLocalDataSource {
  Future<bool> isServiceEnabled();
  Future<void> requestPermission();
}

class AccessibilityLocalDataSourceImpl implements AccessibilityLocalDataSource {
  @override
  Future<bool> isServiceEnabled() async {
    bool isEnabled = await FlutterAccessibilityService.isAccessibilityPermissionEnabled();
    return isEnabled;
  }

  @override
  Future<void> requestPermission() async {
    await FlutterAccessibilityService.requestAccessibilityPermission();
  }
}