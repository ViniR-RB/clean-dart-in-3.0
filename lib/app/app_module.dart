import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo/app/modules/todo/domain/repositories/get_todo_repository.dart';
import 'package:todo/app/modules/todo/domain/usecases/get_all_todos_usecases.dart';
import 'package:todo/app/modules/todo/external/datasources/json_placeholder_datasource.dart';
import 'package:todo/app/modules/todo/infra/datasource/get_todo_datasource.dart';

import 'modules/todo/home_page.dart';
import 'modules/todo/infra/repositories/get_todo_repository_impl.dart';
import 'modules/todo/presenter/todos_controller.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    // domain
    i.add<GetAllTodoUseCase>(GetAllTodoUseCaseImpl.new);

    //external
    i.add(() => Dio(BaseOptions()));
    i.add<GetTodoDatasource>(JsonPlaceholderDataSource.new);
    
    // infra
    i.add<GetTodoRepository>(GetTodoRepositoryImpl.new);

    // presenter
    i.add(TodoController.new);
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const HomePage());
  }
}
