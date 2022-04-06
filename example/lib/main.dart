import 'package:flutter/material.dart';
import 'package:tribally_sdk/tribally_sdk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body:  TriballyView(
              uid: 'YOUR_USER_TOKEN',
              displayName: 'YOUR_USERNAME',
              apiKey: 'YOUR_APIKEY',
              projectId: 'YOUR_PROJECT_ID',
              //optional
              avatar: 'YOUR_USER_AVATAR_URL',
            onTriballyCreated: (controller){
                //add push notifications for your forum view
                controller.setPushToken('pushToken');
            },
          )),
    );
  }
}
