
import 'package:todo_app_localstorage/widgets/enums.dart';

abstract class AllTodosEvent{}

class AllTodosEventFetch extends AllTodosEvent{
  final String query;

  AllTodosEventFetch({this.query = ''});
}

class AllTodosEventFilter extends AllTodosEvent{
  AllTodosEventFilter({required this.todoFilter});

  final TodoFilter todoFilter;
}
