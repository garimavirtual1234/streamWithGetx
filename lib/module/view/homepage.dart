import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stream_getx/module/controller/homepage_controller.dart';

import '../../services/firebase_services.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Playing With List"),
      ),
      body: GetBuilder<HomePageController>(
        init: HomePageController(),
        builder: (controller){
          return Container(
             padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                TextField(
                  controller: controller.todoController,
                  decoration: const InputDecoration(
                    label: Text("Add product in list")
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(onPressed: () async {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if(!currentFocus.hasPrimaryFocus){
                    currentFocus.unfocus();
                    await FirebaseServices().addTodo(controller.todoController.text);
                    controller.todoController.clear();
                  }
                }, child: const Text("Add")),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Your Todos",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GetX<HomePageController>(
                  init: HomePageController(),
                  builder: (todoController){
                   return Expanded(
                        child: ListView.builder(
                          itemCount: controller.todos.length,
                            itemBuilder: (_,index){
                           var time=   DateTime.parse((controller.todos[index].createdOn)!.toDate().toString());
                            return ListTile(
                              // leading:
                              //  Checkbox(value: controller.checkBoxValue,onChanged: (bool? value) {
                              //
                              //    controller.onSelectValue(value, index,"${controller.todos[index].content}");
                              //  },),

                              title: Text("${controller.todos[index].content}"),
                              subtitle: Text("$time"),
                            );
                            }
                        )
                    );
                  },
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}
