import 'package:bot_toast/bot_toast.dart';
import 'package:empty_code/core/data/models/task_model.dart';
import 'package:empty_code/core/data/repositry/task_repositry.dart';

import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/tasks_view/tasks_view.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TaskDetailsController extends GetxController {
  RxBool isUpdate = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TaskModel? task;

  TaskDetailsController(this.task) {
    if (task != null) {
      isUpdate.value = true;
      nameController.text = task!.name ?? '';
      jobController.text = task!.job ?? '';
    }
  }

  void onInit() {
    //  isUpdate.value=widget.post == null;

    super.onInit();
  }

  void submitForm() {
    if (isUpdate.value) {
      _updateTask();
    } else {
      _createTask();
    }
  }

  void _updateTask() {
    if (task != null) {
      TaskRepository()
          .updatetask(
        job: jobController.text,
        name: nameController.text,
        taskId: task!.id,
      )
          .then((value) {
        value.fold(
            (l) => BotToast.showText(text: l),
            (r) => {
                  jobController.clear(),
                  nameController.clear(),
                  taskserivce.updateTaskList(model: r, id: task!.id),
                  BotToast.showText(
                    text: 'Update successful',
                    duration: Duration(seconds: 3),
                    contentPadding: EdgeInsets.all(15),
                    textStyle:
                        TextStyle(fontSize: 13.5, color: AppColors.whiteColor),
                    contentColor: AppColors.purpleColor,
                  ),
                  Get.back(),
                });
      });
    }
  }

  void _createTask() async {
    await TaskRepository()
        .createtask(name: nameController.text, job: jobController.text)
        .then((value) {
      value.fold(
          (l) => BotToast.showText(text: l),
          (r) => {
                jobController.clear(),
                nameController.clear(),
                taskserivce.addToTask(model: r),
                BotToast.showText(
                  text: 'Create successful',
                  duration: Duration(seconds: 3),
                  contentPadding: EdgeInsets.all(15),
                  textStyle:
                      TextStyle(fontSize: 13.5, color: AppColors.whiteColor),
                  contentColor: AppColors.purpleColor,
                ),
                Get.back(),
              });
    });
  }
}
