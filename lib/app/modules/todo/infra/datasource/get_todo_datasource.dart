import 'package:todo/app/modules/todo/domain/entities/todo_entity.dart';

abstract interface class GetTodoDatasource {
  Future<List<TodoEntity>> getTodos();
}