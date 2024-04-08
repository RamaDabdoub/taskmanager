import 'package:bot_toast/bot_toast.dart';
import 'package:empty_code/core/enums/text_style_type.dart';
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text.dart';
import 'package:empty_code/ui/shared/custom_widget/custom_text_field.dart';
import 'package:empty_code/ui/shared/shared_widget/cutsom_button.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:empty_code/ui/views/login_view/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
          padding: EdgeInsetsDirectional.only(
              top: screenWidth(9),
              end: screenWidth(30),
              start: screenWidth(30)),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Customtext(
                  text: ' Login',
                  styleType: TextStyleType.TITLE,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(
                  height: screenWidth(10),
                ),
                Image.asset(
                  "assets/images/pngs/login_rafiki.png",
                  height: screenWidth(2.2),
                ),
                SizedBox(
                  height: screenWidth(13),
                ),
                Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Customtext(
                          text: 'Email',
                          
                          fontWeight: FontWeight.w300,
                          textColor: AppColors.purpleColor,
                        ),
                        SizedBox(
                          height: screenWidth(40),
                        ),
                        SizedBox(
                            width: screenWidth(1),
                            child: CustomTextField(
                              prefixIcon: Icon(Icons.person_outlined),
                              obscureText: false,
                              hintText: 'email',
                              controller: controller.emailController,
                              validator: (value) {
                                if (value!.isEmpty)
                                  return " Please Enter Your Email ";
                                else if (!isEmailValid(value))
                                  return "Please Enter Valid Email ";
                              },
                            )),
                        SizedBox(
                          height: screenWidth(20),
                        ),
                        Customtext(
                          text: 'Password ',
                          textColor: AppColors.purpleColor,
                          fontWeight: FontWeight.w300,
                        ),
                        SizedBox(
                          height: screenWidth(40),
                        ),
                        SizedBox(
                            width: screenWidth(1),
                            child: CustomTextField(
                              obscureText: true,
                             
                              prefixIcon: Icon(Icons.key),
                              hintText: 'password ',
                              controller: controller.codeController,
                              validator: (value) {
                                if (value!.isEmpty)
                                  return " Please Enter Password ";
                                  // else if(!isComplexPassword(value)){
                                  //   return 'Weak Password';
                                  // }
                                
                              },
                            ))
                      ],
                    )),
                SizedBox(
                  height: screenWidth(8),
                ),
                Obx(() {
                   if (controller.isLoading.value) {
                          customLoader();
                          return SizedBox();
                        } else {
                          BotToast.closeAllLoading();
                          return

                  CustomButton(
                    text: ' Login',
                    onPressed: () {
                      controller.Login();
                    },
                          );}
   } )
              
            
               
              ],
            ),
          ]),
    ));
  }
}
