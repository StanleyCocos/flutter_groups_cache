
import 'dart:async';

import 'package:flutter/services.dart';

class FlutterGroups {
  static const MethodChannel _channel = MethodChannel('flutter_groups');

  static Future init(String group) async {
    return await _channel.invokeMethod("init", group);
  }

  static Future<String> getString(String name) async{
    return await _channel.invokeMethod("getGroupString", name);
  }

  static Future<int> getInt(String name) async{
    return await _channel.invokeMethod("getGroupInt", name);
  }

  static Future<dynamic> get(String name) async{
    return await _channel.invokeMethod("getGroup", name);
  }

  static Future setString(String name, {required String value}) async {
    return await _channel.invokeMethod("setGroupString", [name, value]);
  }

  static Future setInt(String name, {required int value}) async {
    return await _channel.invokeMethod("setGroupInt", [name, value]);
  }

  static Future set(String name, {required dynamic value}) async {
    return await _channel.invokeMethod("setGroup", [name, value]);
  }
}
