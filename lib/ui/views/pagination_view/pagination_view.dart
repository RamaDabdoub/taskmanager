import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/pagination_view/pagination_controller.dart';
import 'package:empty_code/ui/views/tasks_view/tasks_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaginationView extends StatefulWidget {
  const PaginationView({super.key});

  @override
  State<PaginationView> createState() => _PaginationViewState();
}

class _PaginationViewState extends State<PaginationView> {
   PaginationController pagController = Get.put(PaginationController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        leading: IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: () {Get.off(TasksView());}),
        backgroundColor: AppColors.purpleColor,
        title: Customtext(
          text: "Pagination Example",
          textColor: AppColors.whiteColor,
          styleType: TextStyleType.SUBTITLE,
        ),
      ),
      body: Obx(
        () => ListView.builder(
          padding: EdgeInsets.all(screenWidth(20)),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: pagController.users.value.data!.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(pagController.users.value.data![index].avatar.toString()),
              ),
              title: Text('${pagController.users.value.data![index].firstName} ${pagController.users.value.data![index].lastName}'),
              subtitle: Text(pagController.users.value.data![index].email.toString()),
            ));
          },
        ),
      ),
 
       bottomNavigationBar: Obx(() => BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: pagController.prevPage,
              icon: Icon(Icons.arrow_back),
            ),
            Text('Page ${pagController.pagenum} of ${pagController.users.value.totalPages!.toInt()}'),
            IconButton(
              onPressed: pagController.nextPage,
              icon: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      )),
    ));
  }
}
