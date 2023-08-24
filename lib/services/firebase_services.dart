

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stream_getx/module/model/todo_model.dart';

class FirebaseServices{

 addTodo(content){
   FirebaseFirestore.instance.collection("products").add({
     'content': content,
     'createdon': Timestamp.now(),
   });
 }


 Stream<List<TodoModel>> listOfData(){
   Stream <QuerySnapshot> stream = FirebaseFirestore.instance.collection('products').snapshots();
   return stream.map((qShot) => qShot.docs.map((doc) => TodoModel(
       documentId:doc.id,
       content: doc.get('content'),
       createdOn: doc.get('createdon')
   )).toList());

 }

}