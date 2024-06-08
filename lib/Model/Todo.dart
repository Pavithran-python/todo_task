

class Todo{
  int? todoUserId;
  int? todoId;
  String? todoMessage;
  late bool todoStatus;

  Todo({
    required this.todoUserId,
    required this.todoId,
    required this.todoMessage,
    required this.todoStatus
  });

  Todo.fromJson({required Map<String,dynamic> todoJson}){
    todoUserId = todoJson["userId"];
    todoId = todoJson["id"];
    todoMessage = todoJson["title"];
    todoStatus = todoJson["completed"]??false;
  }

  Map<String,dynamic> toJson(){
    Map<String,dynamic> todoJson = {};
    todoJson["userId"] = todoUserId;
    todoJson["id"] = todoId;
    todoJson["title"] = todoMessage;
    todoJson["completed"] = todoStatus;
    return todoJson;
  }

}