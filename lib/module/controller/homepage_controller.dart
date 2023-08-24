
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stream_getx/module/model/todo_model.dart';
import 'package:stream_getx/services/firebase_services.dart';

class HomePageController extends GetxController{

 RxList<TodoModel> todoList = RxList<TodoModel>();
 late TextEditingController todoController;
 FirebaseServices services = FirebaseServices();
 List<TodoModel> get todos => todoList.value;
 bool checkBoxValue = false;
 String selectedValue = "";


 @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    todoList.bindStream(services.listOfData());
    todoController = TextEditingController();

  }

  onSelectValue(bool? value,int index,String content){
   selectedValue = content;
   if(selectedValue == todoList[index].content){
     checkBoxValue= value!;
   }else{
     checkBoxValue= false;
   }

   update();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    todoController.dispose();
  }

}