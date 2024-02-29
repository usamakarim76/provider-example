import 'package:flutter/material.dart';

class FavouriteItems with ChangeNotifier{

  List<int> items = [];

  List<int> get selectedItem => items;

  void addItem(int value){
    items.add(value);
    notifyListeners();
  }
  void removeItem(int value){
    items.remove(value);
    notifyListeners();
  }

}