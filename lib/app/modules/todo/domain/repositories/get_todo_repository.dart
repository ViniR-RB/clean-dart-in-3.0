import 'package:dartz/dartz.dart';
import 'package:todo/app/modules/todo/domain/entities/todo_entity.dart';

import '../../../../core/app_exception.dart';

abstract interface class GetTodoRepository {
  Future<Either<AppException, List<TodoEntity>>> getAllTodos();
}
