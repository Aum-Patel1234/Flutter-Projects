import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_localstorage/bloc/all_todos_bloc/all_todos_bloc.dart';
import 'package:todo_app_localstorage/bloc/all_todos_bloc/all_todos_state.dart';

class TodosStatsBody extends StatefulWidget {
  const TodosStatsBody({
    super.key,
  });

  @override
  State<TodosStatsBody> createState() => _TodosStatsBodyState();
}

class _TodosStatsBodyState extends State<TodosStatsBody> {
  final double padding = 20;
  int _touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: AspectRatio(
            aspectRatio: 1, // width : height
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    // color: Colors.amber,
                    margin: EdgeInsets.all(padding),
                    child: BlocBuilder<AllTodosBloc, AllTodosState>(
                      builder: (context, state) {
                        int completed = state.todos.where((todo) => todo.isCompleted).toList().length;
                        int total = state.todos.length;

                        return PieChart(
                          PieChartData(
                            pieTouchData: PieTouchData(
                              touchCallback: (FlTouchEvent event, pieTouchResponse) {
                                setState(() {
                                  if (!event.isInterestedForInteractions ||
                                      pieTouchResponse == null ||
                                      pieTouchResponse.touchedSection == null) {
                                    _touchedIndex = -1;
                                    return;
                                  }
                                  _touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                                });
                              },
                            ),
                            sectionsSpace: 5,
                            centerSpaceRadius: 100,
                            sections: [
                              PieChartSectionData(
                                value: (completed/total).toDouble(),
                                title: _touchedIndex == 0 ? 'Completed' : '',
                                color: Colors.green,
                                radius: _touchedIndex == 0 ? 60 : 50,
                                titleStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),
                              ),
                              PieChartSectionData(
                                value: (1 - (completed/total)).toDouble(),
                                title: _touchedIndex == 1 ? 'Not Completed' : '',
                                color: Colors.red,
                                radius: _touchedIndex == 1 ? 60 : 50,
                                titleStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            indicator(color: Colors.green, tag: 'Completed'),
            indicator(color: Colors.red, tag: 'Not Completed'),
          ],
        )
      ],
    );
  }

  Padding indicator({required Color color, required String tag}) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 20,
            height: 20,
            color: color,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            tag,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
