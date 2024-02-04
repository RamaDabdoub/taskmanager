
import 'package:empty_code/ui/shared/colors.dart';
import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  const CustomTextField(
      {super.key,
      required this.hintText,
      this.controller,
      this.validator,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TextFormField(
        // onChanged: (value) {
        //   FormState.val
        //   formKey.currentState!.validate()
        // },
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        obscuringCharacter: '*',
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.grayColor, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.grayColor, width: 2),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: size.width / 30,
          ),
          fillColor: AppColors.grayColor,
          filled: true,
          contentPadding: EdgeInsets.symmetric(
              vertical: size.width / 20, horizontal: size.width / 20),
          errorStyle:
              TextStyle(color: AppColors.lightblueColor, fontSize: size.width / 24),
        ));
  }
}
