import 'dart:collection';

import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List<String> _items = [];

  UnmodifiableListView<String> get items => UnmodifiableListView(_items);

  void add(String item) {
    _items.add(item);
    notifyListeners();
  }

  void edit(String item, String newItem) {
    int index = _items.indexWhere((element) => element == item);
    _items[index] = newItem;
    notifyListeners();
  }

  void remove(String item) {
    _items.remove(item);
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }
}
