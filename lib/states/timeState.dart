import 'package:flutter/foundation.dart';

class TimeState with ChangeNotifier {
  int initialRestTime = 30;

  int restTime;


  TimeState() : restTime = 0 {
    restTime = initialRestTime;
  }

  int get getRestTime => restTime;

  String get getRestTimeStr => "${restTime ~/ 60 <= 9 ? '0${restTime ~/ 60}' : '${restTime ~/ 60}'}:${restTime % 60 <= 9 ? "0${restTime % 60}" : "${restTime % 60}"}";

  void handlerUpdateSets(int newSets) {
    restTime = newSets;
    notifyListeners();
  }

  void handlerDecreaseSets(){
    restTime--;
    notifyListeners();
  }

  void handlerIncreaseSets(){
    restTime++;
    notifyListeners();
  }

  void handlerInitialSets(){
    restTime = initialRestTime;
    notifyListeners();
  }
}
