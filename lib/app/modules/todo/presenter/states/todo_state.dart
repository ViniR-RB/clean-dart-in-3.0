import 'package:todo/app/modules/todo/domain/entities/todo_entity.dart';

sealed class TodoState {}

final class TodoStartState extends TodoState {}

final class TodoLoadingState extends TodoState {}

final class TodoLoadedState extends TodoState {
  final List<TodoEntity> todos;
  TodoLoadedState(this.todos);
}

final class TodoLoadedErrorState extends TodoState {
  final String message;
  TodoLoadedErrorState(this.message);
}
