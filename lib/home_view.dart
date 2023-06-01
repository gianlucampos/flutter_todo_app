import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/bloc/item_bloc.dart';
import 'package:flutter_todo_app/bloc/item_event.dart';
import 'package:flutter_todo_app/bloc/item_state.dart';
import 'package:flutter_todo_app/model/item.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ItemBloc>(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: _formKey,
            child: TextFormField(
              validator: (value) {
                final currentItem = Item(name: value!);
                if (currentItem.name.trim().isEmpty) {
                  return 'You need to enter a valid value!';
                }
                if (bloc.state.items.contains(currentItem)) {
                  return 'Already added!';
                }
                return null;
              },
              onFieldSubmitted: (value) {
                final currentItem = Item(name: value);
                if (_formKey.currentState!.validate()) {
                  bloc.add(AddItemEvent(item: currentItem));
                  value = '';
                }
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Add item pressing Enter'),
            ),
          ),
        ),
        const Expanded(child: TodoListWidget()),
      ],
    );
  }
}

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ItemBloc>(context);
    return BlocBuilder<ItemBloc, ItemState>(builder: (context, state) {
      if (state is ItemInitialState) {
        return const Center(child: CircularProgressIndicator());
      }

      if (state is ItemSucessState) {
        final items = state.items;
        return ListView.separated(
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(color: Colors.transparent),
          padding: const EdgeInsets.all(20),
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) {
            final currentItem = items[index];
            return ListTile(
                title: Text(currentItem.name),
                tileColor: Colors.blueGrey,
                trailing: Wrap(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () =>
                          bloc.add(RemoveItemEvent(item: currentItem)),
                    ),
                  ],
                ));
          },
        );
      }
      return Container();
    });
  }
}
