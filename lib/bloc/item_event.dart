import 'package:flutter_todo_app/model/item.dart';

abstract class ItemEvent {}

class LoadItemEvent extends ItemEvent {}

class RemoveItemEvent extends ItemEvent {
  Item item;

  RemoveItemEvent({
    required this.item,
  });
}

class AddItemEvent extends ItemEvent {
  Item item;

  AddItemEvent({
    required this.item,
  });
}

class EditItemEvent extends ItemEvent {
  Item item;

  EditItemEvent({
    required this.item,
  });
}