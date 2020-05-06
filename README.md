Android-like logger
===================

A simple logger that uses quite the same API as Android one.

## Example

```
import 'package:logger_android_like/log.dart';

# global application configuration in main() for example
Future main() async {
  ...
  Log.initLogger(loggerName: 'AppFlutterMix', logTagPrefix: 'MY_LOGS_');
  if (kReleaseMode) {
    Log.level = Level.WARNING;
  }
  ...
}

Log.d(LogTag.API, "Preparing to send a request to URL https://");
```

will result in the following log in the console

```
I/flutter ( 4038): FINE : 2020-05-06 10:11:53.960984: [MY_LOGS_API]: Preparing to send a request to URL https://
```
