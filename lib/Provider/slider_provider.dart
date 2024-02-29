import 'package:flutter/foundation.dart';

class ProviderExample with ChangeNotifier{

  double val = 0.75;

  double get value => val;

  void setVal(double change){
    val = change;
    notifyListeners();
  }
}