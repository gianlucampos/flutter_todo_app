import 'package:mobx/mobx.dart';

part 'todo_store.g.dart';

// ignore: library_private_types_in_public_api
class TodoStore = _TodoStore with _$TodoStore;

abstract class _TodoStore with Store {
  @observable
  var items = ObservableList<String>();

  @action
  void addItem(String item) {
    items.add(item);
  }

  @action
  void removeItem(String item) {
    items.remove(item);
  }
}
