import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_task/APIRequest/AllApiMethod.dart';
import 'package:todo_task/Config/ColorConfig.dart';
import 'package:todo_task/Config/SizeConfig.dart';
import 'package:todo_task/Config/TextConfig.dart';
import 'package:todo_task/Config/ValueConfig.dart';
import 'package:todo_task/Model/Todo.dart';
import 'package:todo_task/Page/ProfilePage.dart';
import 'package:todo_task/Page/TodoListPage.dart';
import 'package:todo_task/ReusableComponent/AppBar/AppBarWidget.dart';
import 'package:todo_task/ReusableComponent/BottomBar/bottomBarWidget.dart';
import 'package:todo_task/ReusableComponent/MessageBox/messageBoxWidget.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double screenWidth = 0;
  double screenHeight = 0;
  bool toggleStatus = false;
  int currentIndex = 0;
  bool isAPILoading = false;
  List<Todo> getTodoAPIList = [];
  List<Todo> getTodoList = [];
  List<int> getUserList = [];
  int? selectedUser;

  messageBox({required String getMessage}){
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    final snackBar = messageBoxWidget(screenWidth: screenWidth, screenHeight: screenHeight, getMessage: getMessage,getActionText: TextConfig().messageBoxDismissText,getCallBackFunction: (isClick){
      if(isClick){
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  checkTodoCondition(){
    setState(() {
      getTodoList.clear();
      getTodoList = getTodoAPIList.where((getList) => ((getList.todoStatus==toggleStatus && ((selectedUser==null || selectedUser ==0)?true:selectedUser==getList.todoUserId)))).toList();
      print("todoList Length : ${getTodoList.length}");
      print("total Length : ${getTodoAPIList.length}");
    });
  }

  callTodoAPI() async{
    setState(() {
      isAPILoading = true;
    });
    print("Call Todo API");
    Map<String,dynamic> getUserData = await AllApiMethod().callTodoAPI();
    if(getUserData["status"]){
      print("Success");
      print("User Data : ${getUserData}");
      setState(() {
        getUserList.clear();
        getTodoList.clear();
        getTodoAPIList.clear();
        getTodoAPIList = getUserData["data"];
        getUserList = getUserData["user_data"];
        getUserList.insert(0,0);
      });
      checkTodoCondition();
    }
    else{
      print("Failure");
      print(getUserData["message"]);
      messageBox(getMessage: getUserData["message"]);
    }
    setState(() {
      isAPILoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterNativeSplash.remove();
    callTodoAPI();
  }


  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: toggleAppBarWidget(screenWidth: screenWidth, screenHeight: screenHeight, toggleStatus: toggleStatus, getCallBackToggleClick: (getToggleStatus){
        setState(() {
          toggleStatus = getToggleStatus;
          checkTodoCondition();
        });
      }),
      body: Container(
        alignment: Alignment.center,
        child: isAPILoading?Wrap(children:[Container(width: ValueConfig().getValueWidth(screenWidth: screenWidth, getWidth: SizeConfig().refreshIndicatorSize),height: ValueConfig().getValueWidth(screenWidth: screenWidth, getWidth: SizeConfig().refreshIndicatorSize),child: CircularProgressIndicator(color: ColorConfig().appBarBackgroundColor,),)]):currentIndex==0?TodoListPage(screenWidth: screenWidth, screenHeight: screenHeight,getTodoList: getTodoList):ProfilePage(screenWidth: screenWidth, screenHeight: screenHeight, selectedUser: selectedUser, getUserList: getUserList, callBackSelectedUser: (int getUser){
          setState(() {
            selectedUser = getUser;
            currentIndex = 0;
            callTodoAPI();
          });
        }),
      ),
      bottomNavigationBar:bottomBarWidget(screenWidth: screenWidth, screenHeight: screenHeight,selectedIndex: currentIndex,callBackSelectedIndex: (int getIndex){
        setState(() {
          currentIndex = getIndex;
        });
      }),
    );
  }
}
