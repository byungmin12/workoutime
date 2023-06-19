import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workoutime/widgets/Down_Time.dart';
import 'dart:async';

import '../states/setsState.dart';
import '../states/timeState.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  State<TimerWidget> createState() => _TimerWidget();
}

class _TimerWidget extends State<TimerWidget> with TickerProviderStateMixin {
  late Timer timer;
  late AnimationController animationController;

  int initialRestTime = 30;
  int t = 0;
  int restTime = 30;
  bool isWorkout = false;

  @override
  void initState() {
    final time = Provider.of<TimeState>(context, listen: false);
    animationController = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: Duration(seconds: time.getRestTime)
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final time = Provider.of<TimeState>(context);

    void handlerDecreaseSets() {
      time.handlerUpdateSets(time.restTime - 1);
    }

    void handlerStartTimer() {
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          handlerDecreaseSets();
          if (time.getRestTime == 0) {
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
        if (time.getRestTime == 0) {
          // 여기에 타이머 종료 후 실행할 코드 추가
          time.handlerInitialSets(); // 다시 초기값으로 설정 또는 원하는 동작 수행
          animationController.dispose();
          setState(() {
            isWorkout = false; // isWorkout 값을 변경하여 UI를 갱신
          });
        }
      });
      animationController.repeat(reverse: false);
      animationController.duration = Duration(seconds: time.getRestTime);
      animationController.addListener(() {
          setState(() {});
        });
      animationController.repeat(reverse: false);
      animationController.duration = Duration(seconds: time.getRestTime);
    }

    return Stack(
      children: [
        Align(
          child: Image(
            image: AssetImage(
                "assets/gifs/${isWorkout ? "break-time" : "workout"}.gif"),
          ),
        ),
        SizedBox(
          width: 400,
          height: 400,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CircularProgressIndicator(
                strokeWidth: 20,
                value: animationController.value,
              ),
              Center(
                child: isWorkout
                    ? GestureDetector(
                        onTap: () => {
                          setState(() {
                            isWorkout = false; // isWorkout 값을 변경하여 UI를 갱신
                          }),
                          timer.cancel(),
                          animationController.stop()

                        },
                        child: Text(
                          "${time.getRestTime ~/ 60 <= 9 ? '0${time.getRestTime ~/ 60}' : '${time.getRestTime ~/ 60}'}:${time.getRestTime % 60 <= 9 ? "0${time.getRestTime % 60}" : "${time.getRestTime % 60}"}",
                          style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 80,
                              fontWeight: FontWeight.w900),
                        ),
                      )
                    : DownTime(
                        handlerChangeWorkout: () => {
                              setState(() {
                                isWorkout = true; // isWorkout 값을 변경하여 UI를 갱신
                              }),
                              handlerStartTimer()
                            }),
              )
            ],
          ),
        )
      ],
    );
  }
}
