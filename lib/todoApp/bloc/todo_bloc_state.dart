// ignore_for_file: must_be_immutable

part of 'todo_bloc_bloc.dart';

 

abstract class TodoBlocState extends Equatable {}

class TodoBlocInitial extends TodoBlocState {
  TodoBlocInitial();

  @override
  List<Object?> get props => [];
}

class LoadingTodoState extends TodoBlocState {
  
  LoadingTodoState( );

  @override
  List<Object?> get props => [ ];
}

class LoadedTodoState extends TodoBlocState {
  List<Todo> todoList;
   
  LoadedTodoState({
    required this.todoList,
   
  });
  @override
  List<Object?> get props => [todoList, ];
}

class ErrorTodoState extends TodoBlocState {
   

  ErrorTodoState( );
  @override
  List<Object?> get props => [];
}
