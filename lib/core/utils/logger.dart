import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 5,
      lineLength: 80,
      colors: true,
      printEmojis: true,
      printTime: true,
    ),
  );

  static void log(String message) {
    _logger.i(message);
  }

  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e({message, error, stackTrace});
  }

  static void warning(String message) {
    _logger.w(message);
  }

  static void debug(String message) {
    _logger.d(message);
  }

  static void verbose(String? message) {
    if (message == null) return;
  }
}
