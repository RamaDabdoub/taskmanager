import 'dart:convert';

class TaskModel {
  String? name;
  String? job;
  String? id;
  String? createdAt;

  TaskModel({this.name, this.job, this.id, this.createdAt});

  TaskModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    job = json['job'];
    id = json['id'].toString();
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['job'] = this.job;
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    return data;
  }

  static String encode(List<TaskModel> tasks) => json.encode(
        tasks
            .map<Map<String, dynamic>>((task) => task.toJson())
            .toList(),
      );

  static List<TaskModel> decode(String tasks) =>
      (json.decode(tasks) as List<dynamic>)
          .map<TaskModel>((item) => TaskModel.fromJson(item))
          .toList();
}