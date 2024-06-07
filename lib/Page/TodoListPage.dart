
import 'package:flutter/material.dart';
import 'package:todo_task/Model/Todo.dart';
import 'package:todo_task/ReusableComponent/ListWidget/todoListView.dart';

Widget TodoListPage({required double screenWidth,required double screenHeight,required List<Todo> getTodoList}){
  return Container(
    width: screenWidth,
    height: screenHeight,
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: getTodoList.length,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: ((BuildContext context, int index) {
              return todoListView(screenWidth: screenWidth, screenHeight: screenHeight);
            }),
          ),

        ],
      ),
    ),
  );
}