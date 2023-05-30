import 'package:flutter/material.dart';

import './widgets/sets_widget.dart';
import 'widgets/timer_widget.dart';

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
        children: [Sets(),Timer()],
      )),
    );
  }
}
