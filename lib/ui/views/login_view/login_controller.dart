import 'package:bot_toast/bot_toast.dart';
import 'package:empty_code/core/data/repositry/task_repositry.dart';

import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/login_view/login_view.dart';
import 'package:empty_code/ui/views/tasks_view/tasks_view.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxString passwordError = ''.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;


  void onInit() {

   
    super.onInit();
  }





  Login() async {
    print('Username for login: ${emailController.text}');
    print('Password for login: ${codeController.text}');
    if (!isOnline) {
      BotToast.showText(text: 'Please check internet connection');
      return;
    }
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
    

      await TaskRepository()
          .login(
              email: emailController.text,
              password: codeController.text)
          .then((value) {
        print(value);

        value.fold((l) {
          print('object');
          isLoading.value = false;
          print(isLoading.value);

       BotToast.showText(
  text: l,
  duration: Duration(seconds: 3),
  contentPadding: EdgeInsets.all(15),
   textStyle: TextStyle(fontSize: 13.5,color: AppColors.whiteColor),
  contentColor: AppColors.purpleColor,
);


        }, (r) {
         print(r);
          storage.setTokenInfo(r);
        storage.setLoggedIn(true);
          isLoading.value = false;
          Get.offAll(()=>TasksView());
        });
      });
    }
  }
}
