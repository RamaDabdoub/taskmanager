import 'package:bot_toast/bot_toast.dart';
import 'package:empty_code/core/data/models/users_model.dart';
import 'package:empty_code/core/data/repositry/task_repositry.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaginationController extends GetxController {
Rx<UsersModel> users = UsersModel().obs;

RxInt pagenum=2.obs;

  @override
  void onInit() async {
await fetchUsers();
super.onInit();
  }




 fetchUsers() async {
await TaskRepository().getUsers(pagenum: pagenum.value) .then((value) {
  print(value);
    value.fold((l) => BotToast.showText(text: l), (r) {
      print(r);
                users.value=r;
            
      
       
    });
  });


}

 void nextPage() {
    if (pagenum <users.value.totalPages!.toInt()) {
      pagenum++;
      fetchUsers();
    }
  }

  void prevPage() {
    if (pagenum >=users.value.totalPages!.toInt()) {
      pagenum--;
      fetchUsers();
    }
  }

}