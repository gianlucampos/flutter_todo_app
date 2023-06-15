import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_todo_app/stores/todo_store.dart';

final TodoStore todoStore = TodoStore();

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: _formKey,
            child: TextFormField(
              validator: (value) {
                if (todoStore.items.contains(value)) {
                  return 'Já foi adicionado esse valor';
                }
                return null;
              },
              onFieldSubmitted: (value) {
                if (_formKey.currentState!.validate()) {
                  todoStore.addItem((value));
                  value = '';
                }
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Add item'),
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
    return Observer(
      builder: (_) {
        return ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(color: Colors.transparent),
            padding: const EdgeInsets.all(20),
            itemCount: todoStore.items.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildListTile(todoStore.items[index]);
            });
      },
    );
  }

  ListTile _buildListTile(String item) {
    return ListTile(
      title: Text(item),
      tileColor: Colors.blueGrey,
      trailing: Wrap(
        children: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => todoStore.removeItem(item),
          ),
        ],
      ),
    );
  }
}
