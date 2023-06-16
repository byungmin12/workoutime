import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyRangeTextInputFormatter extends TextInputFormatter {
  final int min;
  final int max;

  MyRangeTextInputFormatter({required this.min, required this.max});

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }
    int number = int.tryParse(newValue.text) ?? 0;
    number = clampNumber(number);
    String clampedValue = number.toString();
    return newValue.copyWith(
      text: clampedValue,
      selection: TextSelection.collapsed(offset: clampedValue.length),
    );
  }

  int clampNumber(int number) {
    return number.clamp(min, max);
  }
}

class TimeInputs extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 50,
          child: TextField(
            controller: minutesController,
            keyboardType: TextInputType.number,
            onChanged: (value) {
// 숫자로 변환하여 사용
              int number = int.tryParse(value) ?? 0;
// 변환된 숫자 사용
// 예: 다른 변수에 할당하거나 상태를 업데이트하는 등의 동작 수행
            },
          ),
        ),
        const Text(":"),
        SizedBox(
          width: 50,
          child: TextField(
            controller: secondsController,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // 숫자만 입력 허용
              MyRangeTextInputFormatter(min: 0, max: 60), // 입력 범위 제한
            ],
            onChanged: (value) {
// 숫자로 변환하여 사용
              int number = int.tryParse(value) ?? 0;


// 변환된 숫자 사용
// 예: 다른 변수에 할당하거나 상태를 업데이트하는 등의 동작 수행
            },
          ),
        ),
      ],
    );
  }
}
