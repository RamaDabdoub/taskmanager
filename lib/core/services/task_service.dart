import 'package:empty_code/core/data/models/task_model.dart';
import 'package:empty_code/core/data/models/update_task.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:get/get.dart';

class TaskService {
  RxList<TaskModel> taskList = storage.getTaskList().obs;

  void addToTask({required TaskModel model}) {
    taskList.add(model);

    storage.setTaskList(taskList);

    print(taskList.length);
  }

  void removeFromTaskList(TaskModel model) {
    taskList.remove(model);
    storage.setTaskList(taskList);
  }

  void updateTaskList({
    String? id,
    required UpdateTask model,
  }) {
    TaskModel taskModel = TaskModel(
    name: model.name,
    job: model.job,
    id: '67', // يمكنك تعيين قيمة للـ id هنا
    createdAt: model.updatedAt, // افتراضاً أن updatedAt يحتوي على التاريخ الجديد للمهمة المحدثة
  );
    int index = taskList.indexWhere((element) => element.id == id);
    taskList.removeAt(index);
    taskList.insert(index, taskModel);

    storage.setTaskList(taskList);
  }
}
