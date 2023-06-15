// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodoStore on _TodoStore, Store {
  late final _$itemsAtom = Atom(name: '_TodoStore.items', context: context);

  @override
  ObservableList<String> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<String> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$_TodoStoreActionController =
      ActionController(name: '_TodoStore', context: context);

  @override
  void addItem(String item) {
    final _$actionInfo =
        _$_TodoStoreActionController.startAction(name: '_TodoStore.addItem');
    try {
      return super.addItem(item);
    } finally {
      _$_TodoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItem(String item) {
    final _$actionInfo =
        _$_TodoStoreActionController.startAction(name: '_TodoStore.removeItem');
    try {
      return super.removeItem(item);
    } finally {
      _$_TodoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items}
    ''';
  }
}
