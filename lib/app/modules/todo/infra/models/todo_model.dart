import 'package:todo/app/modules/todo/domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  TodoModel(
      {required super.id, required super.title, required super.isCompleted});

  factory TodoModel.jsonFromModel(dynamic e) {
    return TodoModel(
        id: e['id'], isCompleted: e['completed'], title: e['title']);
  }
}
