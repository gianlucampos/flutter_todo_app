import 'package:flutter/material.dart';
import 'package:flutter_todo_app/cart_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CartModel>(context, listen: false);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: _formKey,
            child: TextFormField(
              validator: (value) {
                if (provider.items.contains(value)) {
                  return 'Já foi adicionado esse valor';
                }
                return null;
              },
              onFieldSubmitted: (value) {
                if (_formKey.currentState!.validate()) {
                  provider.add(value);
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

class TodoListWidget extends StatefulWidget {
  const TodoListWidget({super.key});

  @override
  State<TodoListWidget> createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CartModel>(context, listen: true);
    return ListView.separated(
      separatorBuilder: (BuildContext context, int index) =>
          const Divider(color: Colors.transparent),
      padding: const EdgeInsets.all(20),
      itemCount: provider.items.length,
      itemBuilder: (BuildContext context, int index) {
        return Consumer<CartModel>(builder: (context, cart, child) {
          return ListTile(
              title: Text(cart.items[index]),
              tileColor: Colors.blueGrey,
              trailing: Wrap(
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => provider.edit(cart.items[index], 'Banana'),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => provider.remove(cart.items[index]),
                  ),
                ],
              ));
        });
      },
    );
  }
}
