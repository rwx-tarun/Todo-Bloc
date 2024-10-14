part of 'to_do_bloc.dart';

enum TodoStatus { initial, success, loading, error }

class TodoState extends Equatable {
  final List<Todo> todos;
  final TodoStatus status;

  TodoState({this.todos = const [], this.status = TodoStatus.initial});

  TodoState copyWith({
    List<Todo>? todo,
    TodoStatus? status,
  }) {
    return TodoState(
      todos: todo ?? this.todos,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [todos, status];

  @override
  factory TodoState.fromJson(Map<String, dynamic> json) {
    try {
      var listOfTodos = (json['todo'] as List<dynamic>)
          .map((e) => Todo.fromJson(e as Map<String, dynamic>))
          .toList();

      return TodoState(
          todos: listOfTodos,
          status: TodoStatus.values.firstWhere(
              (element) => element.name.toString() == json['status']));
    } catch (e) {
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {'todo': todos, 'status': status.name};
  }
}
