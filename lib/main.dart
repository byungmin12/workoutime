import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workoutime/states/setsState.dart';

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
    return ChangeNotifierProvider(
      create: (BuildContext context) => SetsState(),
      child: MaterialApp(
        home: Scaffold(
          body: Column(
            children: [Sets(), TimerWidget()],
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
