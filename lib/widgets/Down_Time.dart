import 'package:flutter/material.dart';

class DownTime extends StatefulWidget {
  final Function handlerChangeWorkout; // handlerChangeWorkout을 인자로 받음

  const DownTime({Key? key, required this.handlerChangeWorkout}) : super(key: key);
  @override
  State<DownTime> createState() => _DownTimeState();
}

class _DownTimeState extends State<DownTime> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.handlerChangeWorkout();
      },
      child: const Text(
        'DOWN TIME',
        style: TextStyle(
          color: Colors.blue,
          fontSize: 60,
          fontWeight: FontWeight.w900),
      ),
    );
  }
}
