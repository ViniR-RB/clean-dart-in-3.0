import 'package:dartz/dartz.dart';
import 'package:todo/app/core/app_exception.dart';
import 'package:todo/app/modules/todo/domain/entities/todo_entity.dart';
import 'package:todo/app/modules/todo/domain/repositories/get_todo_repository.dart';

abstract interface class GetAllTodoUseCase {
  Future<Either<AppException, List<TodoEntity>>> call();
}

class GetAllTodoUseCaseImpl implements GetAllTodoUseCase {
  GetTodoRepository repository;
  GetAllTodoUseCaseImpl(this.repository);
  @override
  Future<Either<AppException, List<TodoEntity>>> call() async {
    final response = repository.getAllTodos();
    return response;
  }
}
