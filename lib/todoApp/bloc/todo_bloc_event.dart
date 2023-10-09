// ignore_for_file: must_be_immutable

part of 'todo_bloc_bloc.dart';

abstract class TodoBlocEvent extends Equatable {}

class AddTodoEvent extends TodoBlocEvent {
  Todo todo;
  AddTodoEvent({
    required this.todo,
  });
  @override
  List<Object?> get props => [todo];
}

class UpdateTodoEvent extends TodoBlocEvent {
  Todo todo;
  UpdateTodoEvent({
    required this.todo,
  });
  @override
  List<Object?> get props => [todo];
}

class DeleteTodoEvent extends TodoBlocEvent {
  int id;
  DeleteTodoEvent({
    required this.id,
  });
  @override
  List<Object?> get props => [id];
}

class ReadTodoEvent extends TodoBlocEvent {
  List<Todo>? todoList;
  ReadTodoEvent({
    this.todoList,
  });
  @override
  List<Object?> get props => [todoList];
}
