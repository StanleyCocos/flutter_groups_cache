import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_groups/flutter_groups.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    // initPlatformState();
    FlutterGroups.init("test.com.test");
  }
  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // print("initPlatformState");
    FlutterGroups.setInt("name", value: 1);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: GestureDetector(
            onTap: (){
              initPlatformState();
            },
            child: Container(
              width: 100,
              height: 50,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
