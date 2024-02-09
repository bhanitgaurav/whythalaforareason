import 'package:flutter/cupertino.dart';

class Log {
  static void d(Object message) {
    debugPrint(message.toString());
  }
}
