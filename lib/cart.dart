import 'package:flutter/material.dart';

import 'item.dart';

class Cart extends ChangeNotifier {
  int num = 0;
  List<item> items = [];
  double price = 0.0;

  void add(item item) {
    items.add(item);
    price = price + item.price;
    notifyListeners();
  }

  void remove(item item) {
    items.remove(item);
    price = price - item.price;
    notifyListeners();
  }
  delchangeNum(){
    num--;
    notifyListeners();

  }
  changeNum() {
    num++;
    notifyListeners();
  }
  int get count_item{
return items.length;

  }
  List<item> get basket{

    return items;
  }
}
