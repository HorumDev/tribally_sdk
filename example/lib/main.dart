import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:tribally_sdk/tribally_sdk.dart';
import 'package:tribally_sdk/widgets/tribally_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body:
        const TriballyView(
          uid: 'roman-cores',
          displayName: 'Roman Cores',
          apiKey: 'YOURS_API_KEY',
          projectId: 'YOURS_PROJECT_ID',
        )),

    );
  }
}