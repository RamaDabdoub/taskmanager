import 'package:empty_code/core/data/models/task_model.dart';
import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/datails_task_view/details_task_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskWidget extends StatelessWidget {
  final TaskModel task;
  const TaskWidget({
    Key? key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: screenWidth(50)),

      child: ListTile(
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: screenWidth(20)),
          child: Customtext(text: task.name.toString()),
        ),
        subtitle: Customtext(text: task.job.toString()),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: (){  Get.bottomSheet(
                 isScrollControlled:true,
                 elevation:5,
                 TaskDetailsView(task: task,)
               
               );}, icon: Icon (Icons.edit),color: AppColors.purpleColor,),
             IconButton(onPressed:() {taskserivce.removeFromTaskList(task);}, icon: Icon (Icons.delete),color: AppColors.redColor,)
          ],
        ),
      ),
      // InkWell(
      //   onTap: () {
      //     Get.to(CreatUpdatePostView(
      //       post: post,
      //     ));
      //   },
      //   child: Icon(
      //     Icons.edit,
      //     size: 27,
      //   ),
      // ),
      // InkWell(
      //   onTap: () async {
      //     await PostRepository().DeletePost(postId: post.id ?? 0).then((value) {
      //       value.fold((l) {
      //         BotToast.showText(text: l);
      //       }, (r) {
      //         BotToast.showText(
      //           text: 'Delete successfully',
      //           duration: Duration(seconds: 3),
      //           contentPadding: EdgeInsets.all(15),
      //           textStyle:
      //               TextStyle(fontSize: 13.5, color: AppColors.whiteColor),
      //           contentColor: AppColors.greenColor,
      //         );
      //         Get.to(PostHome());
      //       });
      //     });
      //   },
      //   child: Icon(
      //     Icons.delete,
      //     size: 27,
      //     color: AppColors.redColor,
      //   ),
      // ),

      //  Stack(
      //   children: [
      //     Positioned(
      //       top: screenWidth(20),
      //       child: Image.network(
      //         product.image!,
      //         width: screenWidth(4.2),
      //         height: screenWidth(4.2),
      //       ),
      //     ),
      //     Positioned(
      //       top: screenWidth(13),
      //       right: screenWidth(10),
      //       child: Container(
      //         width: screenWidth(1.9),
      //         child: Customtext(
      //           text: product.title.toString(),
      //           textColor: AppColors.blackColor,
      //           styleType: TextStyleType.CUSTOM,
      //           fontWeight: FontWeight.w500,
      //           softWrap: true,
      //           maxLines: 100, // هنا يمكنك تحديد عدد الأسطر المراد عرضها
      //         ),
      //       ),
      //     ),

      //   ],
      // ),
    );
  }
}
