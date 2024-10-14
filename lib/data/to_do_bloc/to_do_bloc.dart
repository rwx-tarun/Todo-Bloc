import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_bloc/data/to_do.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'to_do_event.dart';
part 'to_do_state.dart';

class TodoBloc extends HydratedBloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState()) {
    on<TodoStarted>(_onStarted);
    on<AddTodoEvent>(_onAddTodo);
    on<RemoveTodoEvent>(_onRemoveTodo);
    on<AlterTodoEvent>(_onAlterTodo);
  }

  void _onStarted(TodoStarted event, Emitter<TodoState> emit) {
    if (state.status == TodoStatus.success) ;
    emit(state.copyWith(todo: state.todos, status: TodoStatus.success));
  }

  void _onAddTodo(AddTodoEvent event, Emitter<TodoState> emit) {
    emit(state.copyWith(status: TodoStatus.loading));
    try {
      List<Todo> temp = [];
      temp.addAll(state.todos);
      temp.insert(0, event.todo);
      emit(state.copyWith(todo: temp, status: TodoStatus.success));
    } catch (e) {
      emit(state.copyWith(status: TodoStatus.error));
      print(e.toString());
    }
  }

  void _onRemoveTodo(RemoveTodoEvent event, Emitter<TodoState> emit) {
    emit(state.copyWith(status: TodoStatus.loading));
    try {
      state.todos.remove(event.todo);
      emit(state.copyWith(todo: state.todos, status: TodoStatus.success));
    } catch (e) {
      emit(state.copyWith(status: TodoStatus.error));
      print(e.toString());
    }
  }

  void _onAlterTodo(AlterTodoEvent event, Emitter<TodoState> emit) {
    emit(state.copyWith(status: TodoStatus.loading));
    try {
      state.todos[event.index] = state.todos[event.index]
          .copyWith(isDone: !state.todos[event.index].isDone);
      // activeUser = activeUser.copyWith(password: passwordCOntroller.text)
      emit(state.copyWith(todo: state.todos, status: TodoStatus.success));
    } catch (e) {
      emit(state.copyWith(status: TodoStatus.error));
      print(e.toString());
    }
  }

  @override
  TodoState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return TodoState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(TodoState state) {
    // TODO: implement toJson
    return state.toJson();
  }
}
