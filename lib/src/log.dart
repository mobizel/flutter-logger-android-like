import 'package:ansicolor/ansicolor.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

enum LogTag {
  API,
  API_SYNC,
  BLUETOOTH,
  BLUETOOTH_BLE,
  CAMERA,
  DATABASE,
  INTERNAL,
  LOCATION,
  MEDIA_MANAGER,
  OFFLINE,
  PERMISSION,
  SERVICE
}

class Log {
  Logger _logger;
  String _prefix;
  static final Log _instance = Log._privateConstructor();

  Log._privateConstructor();

  factory Log() {
    return _instance;
  }

  /// Initialize logger level (called from main)
  /// Examples
  /// - log all messages (may be verbose): Log().initLogger();
  /// - log INFO and more important messages: Log().initLogger(Level.INFO);
  static initLogger(
      {Level level = Level.ALL,
      String loggerName = 'LoggerAndroidLike',
      String logTagPrefix = ''}) {
    Logger.root.level = level;
    Logger.root.onRecord.listen((LogRecord rec) {
      final levelPadded = rec.level.name.padRight(7);
      print('$levelPadded: ${rec.time}: ${rec.message}');
    });
    
    Log()._prefix = logTagPrefix;
    Log()._logger = Logger(loggerName);
    Log()._logger.info(
        'Initializing logger $loggerName for ${kReleaseMode ? 'RELEASE' : 'DEBUG'} build with level ${level.name}');
  }
  
  static set level (Level level) => Log()._logger.level = level;

  static String _getTag(LogTag tag) {
    return '${Log()._prefix}${describeEnum(tag)}';
  }

  static v(LogTag tag, String message) {
    Log()._logger.finest('[${_getTag(tag)}]: $message');
  }

  static d(LogTag tag, String message) {
    Log()._logger.fine('[${_getTag(tag)}]: $message');
  }

  static i(LogTag tag, String message) {
    Log()._logger.info('[${_getTag(tag)}]: $message');
  }

  static w(LogTag tag, String message) {
    Log()._logger.warning('[${_getTag(tag)}]: $message');
  }

  static e(LogTag tag, String message) {
    AnsiPen red = AnsiPen()..red();
    Log()._logger.severe(red('[${_getTag(tag)}]: $message'));
  }
}
