
import 'package:todo_app_localstorage/widgets/enums.dart';

abstract class AllTodosEvent{}

class AllTodosEventFetch extends AllTodosEvent{}

class AllTodosEventFilter extends AllTodosEvent{
  AllTodosEventFilter({required this.todoFilter});

  final TodoFilter todoFilter;
}
