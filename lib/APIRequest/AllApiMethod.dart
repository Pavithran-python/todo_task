import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_task/APIRequest/ApiUrl.dart';
import 'package:todo_task/Model/Todo.dart';

class AllApiMethod{

  Future<Map<String, dynamic>> callTodoAPI() async{
    Map<String, dynamic> todoResponse = {"status":false,"message":"","data":[],"user_data":[]};
    String todoAPIUrl = "${ApiUrl().baseUrl}${ApiUrl().todoUrl}";
    print(todoAPIUrl);
    try{
      var todoAPIResponse = await http.get(Uri.parse(todoAPIUrl));
      print(todoAPIResponse.body);
      if(todoAPIResponse.statusCode==200){
        todoResponse["status"] = true;
        List getResponseList = jsonDecode(todoAPIResponse.body);
        List<Todo> getTodoList = [];
        List<int> getUserList = [];
        for(int i = 0 ; i < getResponseList.length ; i++){
          Map<String,dynamic> getTodoJson = getResponseList[i];
          getUserList.add(getTodoJson["userId"]);
          getTodoList.add(Todo.fromJson(todoJson: getTodoJson));
        }
        todoResponse["data"] = getTodoList;
        todoResponse["user_data"] = getUserList.toSet().toList();
      }
      else{
        todoResponse["status"] = false;
        Map getResponseMap = jsonDecode(todoAPIResponse.body);
        todoResponse["message"] = getResponseMap["message"]??getResponseMap.toString();
      }
    }
    catch(e){
      todoResponse["status"] = false;
      String getErrorMessage = e.toString()??"";
      todoResponse["message"] = getErrorMessage;
    }
    return todoResponse;
  }


}