import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workoutime/widgets/Down_Time.dart';
import 'dart:async';

import '../states/setsState.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({Key? key}) : super(key: key);

  @override
  State<TimerWidget> createState() => _TimerState();
}

class _TimerState extends State<TimerWidget> {
  late Timer timer;
  int initialRestTime = 30;
  int t = 0;
  int restTime = 30;
  bool isWorkout = false;

  @override
  void initState() {
    super.initState();
  }

  void handlerStartTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        restTime--;
        if (restTime == 0) {
          timer.cancel();
          isWorkout = true;
          final sets = Provider.of<SetsState>(context, listen: false);
          if (sets.getSets > 0) {
            sets.handlerDecreaseSets();
          } else if (sets.getSets == 0) {
            sets.handlerInitialSets();
          }
        }
      });
      if (restTime == 0) {
        // 여기에 타이머 종료 후 실행할 코드 추가
        restTime = initialRestTime; // 다시 초기값으로 설정 또는 원하는 동작 수행
        setState(() {
          isWorkout = false; // isWorkout 값을 변경하여 UI를 갱신
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          child: Image(
            image: AssetImage(
                "assets/gifs/${isWorkout ? "break-time" : "workout"}.gif"),
          ),
        ),
        Positioned.fill(
          top: 0,
          child: Center(
            child: isWorkout
                ? Text(
                    "${restTime ~/ 60 <= 9 ? '0${restTime ~/ 60}' : '${restTime ~/ 60}'}:${restTime % 60 <= 9 ? "0${restTime % 60}" : "${restTime % 60}"}",
                    style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 80,
                        fontWeight: FontWeight.w900),
                  )
                : DownTime(
                    handlerChangeWorkout: () => {
                          setState(() {
                            isWorkout = true; // isWorkout 값을 변경하여 UI를 갱신
                          }),
                          handlerStartTimer()
                        }),
          ),
        ),
      ],
    );
  }
}
