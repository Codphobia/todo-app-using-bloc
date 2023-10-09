import 'package:bloc/bloc.dart';
import 'package:bloc_todo/model/todo.dart';
import 'package:equatable/equatable.dart';

part 'todo_bloc_event.dart';
part 'todo_bloc_state.dart';

class TodoBlocBloc extends Bloc<TodoBlocEvent, TodoBlocState> {
  TodoBlocBloc() : super(TodoBlocInitial()) {
    List<Todo> _todoList = [];

    on<AddTodoEvent>((event, emit) {
      _todoList.add(event.todo);
      emit(LoadedTodoState(
        todoList: List.from(_todoList),
      ));
    });

    on<ReadTodoEvent>((event, emit) {
      if (state is LoadedTodoState) {
        emit(LoadedTodoState(
          todoList: List.from(_todoList),
        ));
      }
    });
    on<DeleteTodoEvent>((event, emit) {
      if (state is LoadedTodoState) {
        _todoList.removeAt(event.id);
        emit(LoadedTodoState(todoList: List.from(_todoList)));
      }
    });
    on<UpdateTodoEvent>((event, emit) {
      final updatedIndex =
          _todoList.indexWhere((todo) => todo.id == event.todo.id);
      if (updatedIndex >= 0) {
        _todoList[updatedIndex] = event.todo;
        emit(LoadedTodoState(
          todoList: List.from(_todoList),
        ));
      }
    });
  }
}
