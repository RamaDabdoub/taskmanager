import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text_field.dart';
import 'package:empty_code/ui/shared/shared_widget/custom_task.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/datails_task_view/details_task_view.dart';
import 'package:empty_code/ui/views/pagination_view/pagination_view.dart';
import 'package:empty_code/ui/views/tasks_view/tasks_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TasksView extends StatefulWidget {
  const TasksView({super.key});

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  TasksController controller = Get.put(TasksController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColors.purpleColor,
          title: Customtext(
            text: "To Do List",
            textColor: AppColors.whiteColor,
            styleType: TextStyleType.SUBTITLE,
          ),
        ),
        body: Obx(
          () => ListView(
            
            children: [

              ListView.builder(
              
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(screenWidth(20)),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: taskserivce.taskList.length,
                itemBuilder: (BuildContext context, int index) {
                  return TaskWidget(
                    task: taskserivce.taskList[index],
                  );
                },
              ),
                Padding(
                  padding:EdgeInsets.all(screenWidth(20)),
                  child: SizedBox(
                    
                    height: screenWidth(7),
                    child: ElevatedButton(
                                onPressed: () {
                                 Get.off(PaginationView());
                                },
                                child:  Customtext(
                      text:  'View Pagination',
                      styleType: TextStyleType.CUSTOM,
                      fontSize: screenWidth(20),
                      fontWeight: FontWeight.w500,
                    ),
                                
                              ),
                  ),
                )
            ],
          ),
        ),
  
        floatingActionButton:
      
            
            FloatingActionButton(
              onPressed: () => Get.bottomSheet(
                  isScrollControlled: true, elevation: 5, TaskDetailsView()),
              child: Icon(Icons.add),
            ),



            
       
      ),
    );
  }
}
