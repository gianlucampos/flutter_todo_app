import 'package:flutter_todo_app/model/item.dart';

abstract class ItemState {
  List<Item> items;
  ItemState({
    required this.items,
  });
}

class ItemInitialState extends ItemState {
  ItemInitialState() : super(items: []);
}

class ItemSucessState extends ItemState {
  ItemSucessState({required List<Item> itens}) : super(items: itens);
}
