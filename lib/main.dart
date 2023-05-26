import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo_app/bloc/item_bloc.dart';
import 'package:flutter_todo_app/bloc/item_event.dart';
import 'package:flutter_todo_app/home_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: BlocProvider(
        create: (context) => ItemBloc()..add(LoadItemEvent()),
        child: Scaffold(body: HomeView()),
      ),
    );
  }
}
