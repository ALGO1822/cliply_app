import 'dart:async';

import 'package:cliply_app/core/error/exception.dart';
import 'package:flutter/services.dart';
import 'package:flutter_accessibility_service/flutter_accessibility_service.dart';

abstract class ClipboardRemoteDatasource {
  Stream<String> get clipboardStream;
}

class ClipboardRemoteDatasourceImpl implements ClipboardRemoteDatasource {
  final _controller = StreamController<String>.broadcast();

  @override
  Stream<String> get clipboardStream => _controller.stream;

  ClipboardRemoteDatasourceImpl() {
    _initListener();
  }

  void _initListener() {
    FlutterAccessibilityService.accessStream.listen((event) async {
      print("System event detected: ${event.eventType}");
      try {
        final ClipboardData? data = await Clipboard.getData(
          Clipboard.kTextPlain,
        );

        if (data != null && data.text != null && data.text!.isNotEmpty) {
          _controller.add(data.text!);
        }
      } on ClipboardPermissionException catch (e) {
        print("Error reading clipboard: $e");
      } catch (e) {
        print("Unexpected error: $e");
      }
    });
  }

  void dispose() {
    _controller.close();
  }
}
