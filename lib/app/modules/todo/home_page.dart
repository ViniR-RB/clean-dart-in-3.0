import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo/app/modules/todo/presenter/states/todo_state.dart';
import 'package:todo/app/modules/todo/presenter/todos_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final TodoController _controller;
  @override
  void initState() {
    _controller = Modular.get();
    _controller.getAllTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home Page'),
      ),
      body: ValueListenableBuilder(
        valueListenable: _controller.notifier,
        builder: (context, value, child) {
          return switch (value) {
            TodoStartState _ => const SizedBox.shrink(),
            TodoLoadingState _ => const Center(
                child: CircularProgressIndicator(),
              ),
            TodoLoadedState value => ListView.builder(
                itemCount: value.todos.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                      value: value.todos[index].isCompleted,
                      title: Text(value.todos[index].title),
                      onChanged: (value) {});
                }),
            TodoLoadedErrorState value => Center(
                child: Text(
                  value.message,
                  style: const TextStyle(fontSize: 24),
                ),
              )
          };
        },
      ),
    );
  }
}
