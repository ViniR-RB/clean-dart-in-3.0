import 'package:dartz/dartz.dart';
import 'package:todo/app/core/app_exception.dart';
import 'package:todo/app/modules/todo/domain/entities/todo_entity.dart';
import 'package:todo/app/modules/todo/domain/erros/todo_exception.dart';
import 'package:todo/app/modules/todo/domain/repositories/get_todo_repository.dart';
import 'package:todo/app/modules/todo/infra/datasource/get_todo_datasource.dart';

class GetTodoRepositoryImpl implements GetTodoRepository {
  final GetTodoDatasource datasource;
  GetTodoRepositoryImpl(this.datasource);
  @override
  Future<Either<AppException, List<TodoEntity>>> getAllTodos() async {
    try {
      final response = await datasource.getTodos();
      return Right(response);
    } on GetTodoDataSourceError catch (e) {
      return Left(GetTodoDataSourceError(message: e.message));
    } catch (e) {
      return Left(AppException(message: e.toString()));
    }
  }
}
