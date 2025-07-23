import 'package:flutter_base_bloc/core/exception/exception.dart';
import 'package:flutter_base_bloc/core/network/database.dart';
import 'package:flutter_base_bloc/data/request/todo_request.dart';
import 'package:flutter_base_bloc/data/response/response_wrapper.dart';
import 'package:flutter_base_bloc/domain/entities/todo.dart';

class TodoServices {
  final dbHelper = DatabaseHelper.intance;

  Future<ResponseWrapper<TodoModel>> addTodo(TodoRequest request) async {
    try {
      final db = await dbHelper.database;
      final id = await db.insert('todos', request.toJson());
      return ResponseWrapper(
          data: TodoModel(
        id: id,
        title: request.title,
        time: request.time,
        latitude: request.latitude,
        longtidu: request.longtidu,
      ));
    } catch (e) {
      throw UnCatchException(overridMessage: e.toString());
    }
  }

  Future<ResponseWrapper<List<TodoModel>>> getTodo(TodoRequest request) async {
    try {
      final db = await dbHelper.database;
      final result = await db.query('todos');
      final todos = result.map((map) => TodoModel.fromJson(map)).toList();
      return ResponseWrapper(data: todos);
    } catch (e) {
      throw UnCatchException(overridMessage: e.toString());
    }
  }
}
