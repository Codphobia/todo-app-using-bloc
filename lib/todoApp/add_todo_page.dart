import 'package:bloc_todo/model/todo.dart';
import 'package:bloc_todo/todoApp/bloc/todo_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class AddPage extends StatelessWidget {
  final bool isUpdate;
  final Todo? todo;
  AddPage({
    super.key,
    required this.isUpdate,
    this.todo,
  });

  TextEditingController titleC = TextEditingController();

  TextEditingController contentC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    titleC.text = todo?.title ?? '';
    contentC.text = todo?.des ?? "";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(
          isUpdate ? 'Update Note' : 'Add Note',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 23),
        child: Column(
          children: [
            TextFormField(
              controller: titleC,
              decoration: const InputDecoration(
                label: Text('Title'),
                hintText: 'Title',
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            TextFormField(
              controller: contentC,
              decoration: const InputDecoration(
                label: Text('Content'),
                hintText: 'Content',
              ),
            ),
            const SizedBox(
              height: 44,
            ),
            ElevatedButton(
                style:
                    ElevatedButton.styleFrom(minimumSize: const Size(300, 52)),
                onPressed: () {
                  // var uuid = Uuid();
                  // Todo todo = Todo(
                  //     id: uuid.v4(), title: titleC.text, des: contentC.text);
                  // context.read<TodoBlocBloc>().add(AddTodoEvent(todo: todo));

                  // Navigator.of(context).pop();
                  if (!isUpdate) {
                    Todo todo = Todo(title: titleC.text, des: contentC.text);
                    context.read<TodoBlocBloc>().add(AddTodoEvent(todo: todo));

                    Navigator.of(context).pop();
                  } else {
                    Todo todo1 = Todo(
                        id: todo!.id, title: titleC.text, des: contentC.text);

                    context
                        .read<TodoBlocBloc>()
                        .add(UpdateTodoEvent(todo: todo1));
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Add'))
          ],
        ),
      ),
    );
  }
}
