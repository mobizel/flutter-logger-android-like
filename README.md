Android-like logger
===================

A simple logger that uses quite the same API as Android one.

## Example

```
import 'package:flutter_logger_android_like/flutter_logger_android_like.dart';

# global application configuration in main() for example
Future main() async {
  ...
  Log.initLogger(
      level: kReleaseMode ? Level.WARNING : Level.ALL,
      loggerName: 'MyLoggerName',
      logTagPrefix: 'MBZ_');

  Log.d(LogTag.API, 'Preparing to send a request to URL https://');
  Log.e(LogTag.BLUETOOTH, 'This is an error log example');
  Log.i('CustomTag', 'A message with a custom log tag');
  ...
}
```

will result in the following logs in the console

```
I/flutter (27453): INFO   : 2020-06-29 10:52:24.676206: Initializing logger MyLoggerName for DEBUG build with level ALL
I/flutter (27453): FINE   : 2020-06-29 10:52:24.686449: [MBZ_API]: Preparing to send a request to URL https://
I/flutter (27453): SEVERE : 2020-06-29 10:52:24.688176: [MBZ_BLUETOOTH]: This is an error log example
I/flutter (27453): INFO   : 2020-06-29 10:52:24.688403: [MBZ_CustomTag]: A message with a custom log tag
```
