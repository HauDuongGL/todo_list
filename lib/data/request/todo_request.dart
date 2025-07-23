import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_request.g.dart';
part 'todo_request.freezed.dart';

@freezed
class TodoRequest with _$TodoRequest {
  const factory TodoRequest({
    int? id,
    String? title,
    String? time,
    double? latitude,
    double? longtidu,
  }) = _TodoRequest;

  factory TodoRequest.fromJson(Map<String, Object?> json) =>
      _$TodoRequestFromJson(json);
}
