part of 'to_do_bloc.dart';

// @immutable
abstract class TodoEvent extends Equatable {}

class TodoStarted extends TodoEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class AddTodoEvent extends TodoEvent {
  Todo todo;
  AddTodoEvent({required this.todo});
  @override
  List<Object?> get props => throw UnimplementedError();
}

class RemoveTodoEvent extends TodoEvent {
  Todo todo;
  RemoveTodoEvent({required this.todo});

  @override
  List<Object?> get props => throw UnimplementedError();
}

class AlterTodoEvent extends TodoEvent {
  int index;
  AlterTodoEvent({required this.index});
  @override
  List<Object?> get props => throw UnimplementedError();
}
