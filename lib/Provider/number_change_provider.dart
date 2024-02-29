import 'package:flutter/cupertino.dart';

class ChangeNumber with ChangeNotifier {
  int num = 0;

  int get number => num;
  void setCount() {
    num++;
    notifyListeners();
  }

  void resetCount() {
    num = 0;
    notifyListeners();
  }

  void decCount() {
    num--;
    notifyListeners();
  }
}
