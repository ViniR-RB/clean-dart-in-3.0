import 'package:dio/dio.dart';
import 'package:todo/app/modules/todo/domain/entities/todo_entity.dart';
import 'package:todo/app/modules/todo/domain/erros/todo_exception.dart';
import 'package:todo/app/modules/todo/infra/datasource/get_todo_datasource.dart';
import 'package:todo/app/modules/todo/infra/models/todo_model.dart';

class JsonPlaceholderDataSource implements GetTodoDatasource {
  final Dio dio;
  JsonPlaceholderDataSource(this.dio);
  @override
  Future<List<TodoEntity>> getTodos() async {
    final Response<List<dynamic>> response =
        await dio.get('https://jsonplaceholder.typicode.com/todos/');
    if (response.statusCode == 200) {
      final list = response.data!.map(TodoModel.jsonFromModel).toList();
      return list;
    } else {
      throw GetTodoDataSourceError(message: 'Foi impossivel pegar os Todos');
    }
  }
}
