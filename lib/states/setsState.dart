import 'package:flutter/foundation.dart';

class SetsState with ChangeNotifier {
  int sets = 5;

  int get getSets => sets;

  void handlerUpdateSets(int newSets) {
      sets = newSets;
      notifyListeners();
  }

  void handlerDecreaseSets(){
    sets--;
    notifyListeners();
  }
}
