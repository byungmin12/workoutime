import 'package:flutter/material.dart';

import './widgets/Sets.dart';

void main() {
  runApp(MaterialApp(
    home: Main(),
    title: "WorkouTime",
  ));
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Column(
        children: [Sets()],
      )),
    );
  }
}
