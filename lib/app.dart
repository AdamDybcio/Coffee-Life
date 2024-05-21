import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Life',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: null,
    );
  }
}
