import 'package:flutter/material.dart';

class Timer extends StatefulWidget {
  const Timer({Key? key}) : super(key: key);

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Align(
          child: Image(
            image: AssetImage("assets/gifs/workout.gif"),
          ),
        ),
        Positioned.fill(
          top: 0,
          child: Center(
            child: Text(
              "12:12",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 80,
                  fontWeight: FontWeight.w900),
            ),
          ),
        ),
      ],
    );
  }
}
