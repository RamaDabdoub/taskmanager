import 'package:empty_code/core/data/models/task_model.dart';
import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text_field.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/datails_task_view/details_task_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskDetailsView extends StatefulWidget {
  final TaskModel? task;
  const TaskDetailsView({super.key, this.task});

  @override
  State<TaskDetailsView> createState() => _TaskDetailsViewState();
}

class _TaskDetailsViewState extends State<TaskDetailsView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskDetailsController>(
      init: TaskDetailsController(widget.task),
      builder: (controller) => 
      Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.purpleColor),
            borderRadius: BorderRadius.circular(15)),
       
        
        child: Padding(
          padding:EdgeInsets.all(screenWidth(20)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextField(
                obscureText: false,
                hintText: 'name',
                controller: controller.nameController,
                validator: (value) {},
              ),
              SizedBox(
                height: screenWidth(20),
              ),
        
              CustomTextField(
                obscureText: false,
                 boxsize: screenWidth(4),
                hintText: 'job',
               
                controller: controller.jobController,
                validator: (value) {},
              ),
              SizedBox(
                height: screenWidth(20),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.submitForm();
                },
                child: Obx(
                  () => Customtext(
                    text: controller.isUpdate.value ? 'Update Task' : 'Add Task',
                  textColor: AppColors.purpleColor,
                  ),
                ),
              )
        
            
            ],
          ),
        ),
      ),
    );
  }
}
