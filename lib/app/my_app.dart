import 'package:bot_toast/bot_toast.dart';
import 'package:empty_code/app/my_app_controller.dart';

import 'package:empty_code/core/translation/app_translation.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/views/login_view/login_view.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     MyAppController controller = Get.put(MyAppController());
      return GetMaterialApp(
     
        translations: AppTranslation(),
        debugShowCheckedModeBanner: false,
        builder: BotToastInit(), //1. call BotToastInit
        navigatorObservers: [BotToastNavigatorObserver()],
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Alexandria',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: AppColors.grayColor, // لون المؤشر
          ),
        ),
      
   
    home: LoginView());
  }
}


