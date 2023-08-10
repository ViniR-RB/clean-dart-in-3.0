import 'package:flutter/material.dart';
import 'package:todo/app/modules/todo/domain/usecases/get_all_todos_usecases.dart';
import 'package:todo/app/modules/todo/presenter/states/todo_state.dart';

class TodoController {
  final GetAllTodoUseCase useCase;
  TodoController(this.useCase);

  final ValueNotifier<TodoState> _state = ValueNotifier(TodoStartState());

  _emit(TodoState state) {
    _state.value = state;
  }

  Future<void> getAllTodos() async {
    _emit(TodoLoadingState());
    final result = await useCase.call();
    result.fold((l) {
      _emit(TodoLoadedErrorState(l.message));
    }, (r) {
      _emit(TodoLoadedState(r));
    });
  }

  ValueNotifier<TodoState> get notifier => _state;
  TodoState get state => _state.value;
}
