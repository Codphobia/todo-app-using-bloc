import 'package:bloc_todo/model/todo.dart';
import 'package:bloc_todo/todoApp/add_todo_page.dart';
import 'package:bloc_todo/todoApp/bloc/todo_bloc_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeListScreen extends StatelessWidget {
  final String title;
  const HomeListScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: BlocBuilder<TodoBlocBloc, TodoBlocState>(
        builder: (context, state) {
          if (state is LoadingTodoState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadedTodoState) {
            final todoList = state.todoList;
            if (todoList.isEmpty) {
              return const Center(
                child: Text('List is Empty'),
              );
            }
            return ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                final todo = todoList[index];
                return ListTile(
                  onTap: () {
                    todo.id = index.toString();
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          fullscreenDialog: true,
                          builder: (context) {
                            return AddPage(
                              isUpdate: true,
                              todo: todo,
                            );
                          },
                        ));
                  },
                  leading: CircleAvatar(child: Text('${index + 1}')),
                  title: Text(todo.title),
                  subtitle: Text(todo.des),
                  trailing: Column(children: [
                    IconButton(
                        onPressed: () {
                          context
                              .read<TodoBlocBloc>()
                              .add(DeleteTodoEvent(id: index));
                        },
                        icon: const Icon(Icons.delete_outlined))
                  ]),
                );
              },
            );
          } else if (state is ErrorTodoState) {
            return const Center(
              child: Text('Error'),
            );
          } else {
            // context.read<TodoBlocBloc>().add(ReadTodoEvent(todoList: [])); // You can pass the actual list you want to read here
            context.read<TodoBlocBloc>().add(ReadTodoEvent());
            return const Center(
              child: Text('No data available'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                fullscreenDialog: true,
                builder: (context) {
                  return AddPage(
                    isUpdate: false,
                  );
                },
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
