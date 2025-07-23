import 'package:flutter_base_bloc/core/result/result.dart';
import 'package:flutter_base_bloc/data/request/todo_request.dart';
import 'package:flutter_base_bloc/domain/entities/todo.dart';

abstract class TodoRepository {
  Future<Result<List<TodoModel>>> getTodo(TodoRequest request);
  Future<Result<TodoModel>> addTodo(TodoRequest request);
}
