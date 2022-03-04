import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:tribally_sdk/tribally_sdk.dart';
import 'package:tribally_sdk/widgets/tribally_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: const SizedBox(
              height: 400,
              child: TriballyView(
                  uid: 'YOUR_USER_TOKEN',
                  displayName: 'YOUR_USERNAME',
                  apiKey: 'YOUR_APIKEY',
                  projectId: 'YOUR_PROJECT_ID',
                  avatar: 'YOUR_USER_AVATAR_URL'))),
    );
  }
}
