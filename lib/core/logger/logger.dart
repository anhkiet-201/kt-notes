import 'package:logger/logger.dart';

/// A global instance of the application logger.
/// Use this to log messages throughout the application.
final log = _AppLogger();

/// A custom logger class that wraps the Logger from the logger package.
/// It provides convenience methods for logging at different levels with predefined settings.
class _AppLogger {
  /// The underlying Logger instance from the logger package.
  /// It is configured with custom settings for output formatting.
  final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,        // Number of method calls to be displayed
      errorMethodCount: 8,   // Number of method calls if stacktrace is provided
      lineLength: 120,       // Width of the output
      colors: true,          // Colorful log messages
      printEmojis: true,     // Print an emoji for each log message
      printTime: false,      // Don't print the time for each log message
    ),
  );

  /// Logs a debug message.
  /// 
  /// Use this for diagnostic information useful for debugging.
  /// 
  /// [message] is the message to be logged. It can be any object, which will
  /// be converted to a string representation.
  void d(dynamic message) => _logger.d(message);

  /// Logs an info message.
  /// 
  /// Use this for general information about application flow.
  /// 
  /// [message] is the informational message to be logged.
  void i(dynamic message) => _logger.i(message);

  /// Logs a warning message.
  /// 
  /// Use this when something unexpected happened but the application can continue functioning.
  /// 
  /// [message] is the warning message.
  /// [error] is an optional error object associated with the warning.
  /// [stackTrace] is an optional stack trace that can be provided for more context.
  void w(dynamic message, {dynamic error, StackTrace? stackTrace}) =>
      _logger.w(message, error: error, stackTrace: stackTrace);

  /// Logs an error message.
  /// 
  /// Use this when something has gone wrong in the application.
  /// 
  /// [error] is the error object to be logged.
  /// [message] is an optional message providing more context about the error. 
  ///           If not provided, the default message "Error" will be used.
  /// [stackTrace] is an optional stack trace associated with the error.
  void e(dynamic error, {Object? message, StackTrace? stackTrace}) =>
      _logger.e(message ?? 'Error', error: error, stackTrace: stackTrace);
}