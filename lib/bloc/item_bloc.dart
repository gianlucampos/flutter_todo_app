import 'package:bloc/bloc.dart';
import 'package:flutter_todo_app/bloc/item_event.dart';
import 'package:flutter_todo_app/bloc/item_state.dart';
import 'package:flutter_todo_app/repository/item_repository.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final ItemRepository _repository = ItemRepository();

  ItemBloc() : super(ItemInitialState()) {
    on<LoadItemEvent>(
      (event, emit) => emit(
        ItemSucessState(itens: _repository.getItems()),
      ),
    );

    on<AddItemEvent>((event, emit) {
      _repository.addItem(event.item);
      emit(ItemSucessState(itens: _repository.getItems()));
    });

    on<RemoveItemEvent>((event, emit) {
      _repository.removeItem(event.item);
      emit(ItemSucessState(itens: _repository.getItems()));
    });

    
  }
}
