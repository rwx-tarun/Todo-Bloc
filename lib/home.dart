import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_bloc/data/to_do.dart';
import 'package:to_do_bloc/data/to_do_bloc/to_do_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void addTodoMethod(Todo todo) {
      context.read<TodoBloc>().add(AddTodoEvent(todo: todo));
    }

    void alterTodoMethod(int index) {
      context.read<TodoBloc>()..add(AlterTodoEvent(index: index));
    }

    void removeTodoMethod(Todo todo) {
      context.read<TodoBloc>().add(RemoveTodoEvent(todo: todo));
    }

    TextEditingController titleCtrl = TextEditingController();
    TextEditingController subtitleCtrl = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "TO DO",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Add a task"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: titleCtrl,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter Task ',
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: subtitleCtrl,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter details',
                        ),
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          addTodoMethod(
                            Todo(
                              title: titleCtrl.text,
                              subtitle: subtitleCtrl.text,
                              isDone: false,
                            ),
                          );
                          titleCtrl.text = "";
                          subtitleCtrl.text = "";
                          Navigator.pop(context);
                        },
                        child: Text("Add")),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Discard")),
                  ],
                );
              });
        },
        child: Icon(
          CupertinoIcons.add,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<TodoBloc, TodoState>(
          builder: (ctx, state) {
            if (state.status == TodoStatus.loading) {
              return CircularProgressIndicator();
            } else if (state.status == TodoStatus.success) {
              return ListView.separated(
                itemCount: state.todos.length,
                separatorBuilder: (ctx, index) {
                  return Divider(height: 10);
                },
                itemBuilder: (ctx, index) {
                  return Slidable(
                    child: ListTile(
                      title: Text(state.todos[index].title),
                      subtitle: Text(state.todos[index].subtitle),
                      trailing: Checkbox(
                        value: state.todos[index].isDone,
                        onChanged: (value) {
                          alterTodoMethod(index);
                        },
                      ),
                    ),
                    startActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (_) {
                            removeTodoMethod(state.todos[index]);
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: "Delete",
                        )
                      ],
                    ),
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
