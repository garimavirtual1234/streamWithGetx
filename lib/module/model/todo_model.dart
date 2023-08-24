
import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel{
  String? documentId;
  String? content;
  Timestamp? createdOn;

  TodoModel({
    this.documentId,
    required this.content,
    required this.createdOn
});

factory TodoModel.fromJson(Map<String, dynamic> json){
  return TodoModel(
      content: json['content'],
      createdOn: json['createOn']);
}
}