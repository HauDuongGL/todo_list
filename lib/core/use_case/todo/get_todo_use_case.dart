import 'package:flutter_base_bloc/core/network/di/module.dart';
import 'package:flutter_base_bloc/core/result/result.dart';
import 'package:flutter_base_bloc/core/use_case/base/base_use_case.dart';
import 'package:flutter_base_bloc/data/request/todo_request.dart';
import 'package:flutter_base_bloc/domain/entities/todo.dart';
import 'package:flutter_base_bloc/domain/repository/repository.dart';

class GetTodoUseCase
    implements BaseUseCase<TodoRequest, Result<List<TodoModel>>> {
  final _repo = getIt.get<TodoRepository>();

  @override
  Future<Result<List<TodoModel>>> call(param) {
    final result = _repo.getTodo(param);
    return result;
  }
}
