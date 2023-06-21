import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../states/timeState.dart';


class TimeInputs extends StatefulWidget {
  final TextEditingController minutesController;
  final TextEditingController secondsController;
  final Function handlerSetTimer;
  TimeInputs({
    Key? key,
    required this.minutesController,
    required this.secondsController,
    required this.handlerSetTimer,
  }) : super(key: key);

  @override
  State<TimeInputs> createState() => _TimeInputsState();
}


class _TimeInputsState extends State<TimeInputs> {
  int restTime = 0;

  @override
  void initState() {
    super.initState();
    final time = Provider.of<TimeState>(context, listen: false);
    restTime = time.getRestTime;
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 50,
          child: TextField(
            controller: widget.minutesController,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              int minutes = int.tryParse(value) ?? 0;
              if (minutes > 99) return;
              restTime = minutes * 60 + (restTime % 60);
              widget.handlerSetTimer(restTime);
            },
          ),
        ),
        const Text(":"),
        SizedBox(
          width: 50,
          child: TextField(
            controller: widget.secondsController,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              int seconds = int.tryParse(value) ?? 0;
              print(seconds);
              restTime = (restTime ~/ 60) * 60 + seconds;
              widget.handlerSetTimer(restTime);
            },
          ),
        ),
      ],
    );
  }
}

