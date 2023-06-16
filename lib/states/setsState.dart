import 'package:flutter/foundation.dart';

class SetsState with ChangeNotifier {
  int sets = 5;

  int get getSets => sets;

  void handlerUpdateSets(int newSets) {
      sets = newSets;
      notifyListeners();
  }

  void handlerDecreaseSets(){
    if(sets <= 0)return ;

    sets--;
    notifyListeners();
  }

  void handlerIncreaseSets(){
    sets++;
    notifyListeners();
  }

  void handlerInitialSets(){
    sets = 5;
    notifyListeners();
  }
}
