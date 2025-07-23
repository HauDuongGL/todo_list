import 'package:flutter_base_bloc/core/result/result.dart';
import 'package:flutter_base_bloc/data/request/todo_request.dart';
import 'package:flutter_base_bloc/data/response/response_wrapper.dart';
import 'package:flutter_base_bloc/data/services/todo_services.dart';
import 'package:flutter_base_bloc/domain/entities/todo.dart';
import 'package:flutter_base_bloc/domain/repository/repository.dart';

class TodoRepoImpl implements TodoRepository {
  final TodoServices _todoServices;

  TodoRepoImpl(this._todoServices);

  @override
  Future<Result<TodoModel>> addTodo(TodoRequest request) {
    return runCatchingAsync<ResponseWrapper<TodoModel>, TodoModel>(
      () => _todoServices.addTodo(request),
      (res) => res.data,
    );
  }

  @override
  Future<Result<List<TodoModel>>> getTodo(TodoRequest request) {
    return runCatchingAsync<ResponseWrapper<List<TodoModel>>, List<TodoModel>>(
      () => _todoServices.getTodo(request),
      (res) => res.data ?? [],
    );
  }
}
