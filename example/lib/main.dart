import 'package:flutter/material.dart';
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
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: const TriballyView(
                  uid: 'roman-cores',
                  displayName: 'Roman Cores',
                  apiKey: 'tribally_ri673tgp-SZvWE24SLIIq1RzihgscY3l',
                  projectId: '5f97767a-c51c-4e83-b22a-c93b34a2ad86',
          // primary: Colors.red,

          )),
    );
  }
}
