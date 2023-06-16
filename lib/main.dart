import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workoutime/states/setsState.dart';
import 'package:workoutime/states/timeState.dart';

import './widgets/setting_widget.dart';
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
    return MultiProvider(
      child: MaterialApp(
        home: Scaffold(
          body: Column(
            children: [Setting(), TimerWidget()],
          ),
          backgroundColor: Colors.white,
        ),
      ),
      providers : [
        ChangeNotifierProvider(
          create: (BuildContext context) => SetsState(),
        ),
        ChangeNotifierProvider<TimeState>(
          create: (BuildContext context) => TimeState(),
        ),
      ]
      ,
    );
  }
}
