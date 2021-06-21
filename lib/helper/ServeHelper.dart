import 'dart:core';

import 'package:process_run/shell.dart';
import 'PackageHelper.dart';
import 'RouteConfigHelper.dart';
import 'DataBaseHelper.dart';

class ServeHelper {
  static void run(List<String> arguments) {
    DataBaseHelper.run();

    return;

    bool ispass = RouteConfigHelper.analyseFile();
    if (!ispass) {
      print('serve has been stop, some mistake has been print above');
      return;
    }

    _runServe(arguments);
  }

  static void _runServe(List<String> arguments) {
    var str = 'dart run bin\\' +
        PackageHelper.getPackageName() +
        '.dart ' +
        arguments.join(' ');

    Shell().run(str);
  }
}
