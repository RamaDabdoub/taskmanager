import 'package:bot_toast/bot_toast.dart';
import 'package:empty_code/core/data/models/task_model.dart';
import 'package:empty_code/core/data/repositry/task_repositry.dart';
import 'package:empty_code/core/services/task_service.dart';
import 'package:empty_code/ui/shared/colors.dart';

import 'package:empty_code/ui/shared/custom_widget/custom_toast.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/tasks_view/tasks_view.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';


class TasksController extends GetxController {

 
   TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void onInit() async {

super.onInit();
  }





  creatpost() async{
    
   await TaskRepository().createtask(name: nameController.text, job: jobController.text)
  .then((value) {
    value.fold((l) => BotToast.showText(text: l), (r) {
        BotToast.showText(
                  text: 'Create successful',
                  duration: Duration(seconds: 3),
                  contentPadding: EdgeInsets.all(15),
                  textStyle:
                      TextStyle(fontSize: 13.5, color: AppColors.whiteColor),
                  contentColor: AppColors.purpleColor,
                );
      taskserivce.addToTask(model: r);
       Get.to(TasksView());
    });
  });
 
  }



  
}
