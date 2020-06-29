import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_logger_android_like/flutter_logger_android_like.dart';

void main() {
  Log.initLogger(
      level: kReleaseMode ? Level.WARNING : Level.ALL,
      loggerName: 'MyLoggerName',
      logTagPrefix: 'MBZ_');

  Log.d(LogTag.API, 'Preparing to send a request to URL https://');
  Log.e(LogTag.BLUETOOTH, 'This is an error log example');
  Log.i('CustomTag', 'A message with a custom log tag');

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Logger example'),
        ),
        body: Center(
          child: Text('Check console logs'),
        ),
      ),
    );
  }
}
