
import 'dart:async';

import 'package:flutter/services.dart';


class Tribally {
  static const MethodChannel _channel = MethodChannel('tribally');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  //call before the showing widget
  static userLogin({String? uid, String? displayName, String? avatar}) {
    return _channel.invokeMethod('login', <String, dynamic>{
      'uid': uid,
      'displayName': displayName,
      'avatar': avatar,
    });
  }
}
