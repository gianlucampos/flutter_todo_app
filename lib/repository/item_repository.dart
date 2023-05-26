import 'package:flutter_todo_app/model/item.dart';

class ItemRepository {
  final List<Item> _items = [
    Item(name: 'Passear com Dogs'),
    Item(name: 'Trocar plano internet'),
    Item(name: 'Comprar remédios'),
  ];

  List<Item> getItems() {
    return _items;
  }

  bool removeItem(Item item) {
    return _items.remove(item);
  }

  bool addItem(Item item) {
    _items.add(item);
    return true;
  }
}
