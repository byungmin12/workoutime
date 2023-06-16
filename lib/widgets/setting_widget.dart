import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workoutime/states/setsState.dart';
import 'package:workoutime/states/timeState.dart';
import 'package:workoutime/widgets/sets_widget.dart';
import 'package:workoutime/widgets/timeInputs.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _Setting();
}

class _Setting extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    final sets = Provider.of<SetsState>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            showModal(context); // setCnt 값을 전달
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  return Colors.red; // 버튼의 색상 지정
                },
              ),
              fixedSize: MaterialStateProperty.resolveWith<Size?>(
                (Set<MaterialState> states) {
                  return const Size.square(100); // 버튼의 크기 지정
                },
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(19),
                ),
              ))),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${sets.getSets}", // setCnt 값 사용
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 24,
                  ),
                ),
                const Text(
                  "SETS",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

void showModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          final sets = Provider.of<SetsState>(context);
          final time = Provider.of<TimeState>(context);
          TextEditingController minutesController = TextEditingController();
          TextEditingController secondsController = TextEditingController();
          TextEditingController setsController = TextEditingController();

          minutesController.text = time.getRestTime ~/ 60 <= 9 ? '0${time.getRestTime ~/ 60}' : '${time.getRestTime ~/ 60}';
          secondsController.text = time.getRestTime % 60 <= 9 ? "0${time.getRestTime % 60}" : "${time.getRestTime % 60}";
          setsController.text = "${sets.getSets}";

          return Container(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                children: [
                  Sets(
                    title: "sets",
                    cnt: sets.getSets,
                    InputWidget: SizedBox(
                      width: 100,
                      child: TextField(
                        controller: setsController,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          int number = int.tryParse(value) ?? 0;
                        },
                      ),
                    ),
                    handlerIncreaseSets: sets.handlerIncreaseSets,
                    handlerDecreaseSets: sets.handlerDecreaseSets,
                  ),
                  Sets(
                    title: "time",
                    cnt: time.getRestTimeStr,
                    InputWidget: TimeInputs(
                      minutesController: minutesController,
                      secondsController: secondsController,
                      handlerSetTimer: time.handlerUpdateSets,
                    ),
                    handlerIncreaseSets: time.handlerIncreaseSets,
                    handlerDecreaseSets: time.handlerDecreaseSets,
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
