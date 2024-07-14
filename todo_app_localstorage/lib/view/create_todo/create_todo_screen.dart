import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_localstorage/bloc/all_todos_bloc/all_todos_bloc.dart';
import 'package:todo_app_localstorage/bloc/all_todos_bloc/all_todos_event.dart';
import 'package:todo_app_localstorage/bloc/create_todo/create_todo_bloc.dart';
import 'package:todo_app_localstorage/bloc/create_todo/create_todo_event.dart';
import 'package:todo_app_localstorage/bloc/create_todo/create_todo_state.dart';
import 'package:todo_app_localstorage/model/todo_model.dart';
import 'package:todo_app_localstorage/view/create_todo/custom_date_time_picker.dart';
import 'package:todo_app_localstorage/view/create_todo/custom_textfield.dart';
import 'package:todo_app_localstorage/view/create_todo/functions/show_snackbar.dart';
import 'package:todo_app_localstorage/view/create_todo/functions/static_date_time.dart';

class CreateTodoScreen extends StatefulWidget {
  const CreateTodoScreen({super.key, this.todo});

  final TodoModel? todo;

  @override
  State<CreateTodoScreen> createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  final TextEditingController _titlecontroller = TextEditingController();
  final TextEditingController _descriptioncontroller = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.todo != null) {
      _titlecontroller.text = widget.todo!.title;
      _descriptioncontroller.text = widget.todo!.description ?? '';
      StaticDateTime.date = widget.todo!.toBeCompletedByDate;
      StaticDateTime.time = widget.todo!.toBeCompletedByTime;
    } else {
      StaticDateTime.date = DateTime.now();
      StaticDateTime.time = const TimeOfDay(hour: 8, minute: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<CreateTodoBloc, CreateTodoState>(
      listener: (context, state) {
        if (state.todoStatus == TodoStatus.completed) {
          Navigator.of(context).pop();
          showSnackBar('Todo Created !');
        }
      },
      builder: (context, state) {
        return PopScope(
          canPop: state.todoStatus != TodoStatus.loading,
          child: Stack(
            children: [
              Scaffold(
                appBar: AppBar(
                  title: Text(
                    widget.todo == null ? 'Create Todo' : 'Edit Todo',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  centerTitle: true,
                ),
                body: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextField(
                        purpose: 'Title',
                        icon: Icons.title,
                        controller: _titlecontroller,
                        formkey: key,
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      CustomTextField(
                        purpose: 'Description',
                        icon: Icons.description,
                        controller: _descriptioncontroller,
                        formkey: null,
                      ),
                      Divider(
                        height: height * 0.03,
                      ),
                      const CustomDateAndTimePicker(),
                    ],
                  ),
                ),
                floatingActionButton: FloatingActionButton.extended(
                  onPressed: () {
                    if (key.currentState!.validate()) {
                      context.read<CreateTodoBloc>().add(
                        CreateTodoEventOnCreate(
                          title: _titlecontroller.text,
                          description: _descriptioncontroller.text,
                          toBeCompletedByDate: StaticDateTime.date,
                          toBeCompletedByTime: StaticDateTime.time,
                        ),
                      );
                      context.read<AllTodosBloc>().add(AllTodosEventFetch());
                    }
                  },
                  label: Text(
                    widget.todo == null ? 'Create' : 'Save',
                    style: const TextStyle(fontSize: 18),
                  ),
                  icon: const Icon(Icons.save),
                  backgroundColor: Colors.deepPurple,
                ),
              ),
              if (state.todoStatus == TodoStatus.loading)
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _titlecontroller.dispose();
    _descriptioncontroller.dispose();
  }
}
