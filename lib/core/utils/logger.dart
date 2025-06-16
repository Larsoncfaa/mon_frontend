import 'package:flutter/foundation.dart';

class Logger {
  static void info(String message) {
    debugPrint('[INFO] $message');
  }

  static void warning(String message) {
    debugPrint('[WARNING] $message');
  }

  static void error(String message, [Object? error, StackTrace? stackTrace]) {
    debugPrint('''
[ERROR] $message
Error: $error
StackTrace: $stackTrace
''');
  }
}
