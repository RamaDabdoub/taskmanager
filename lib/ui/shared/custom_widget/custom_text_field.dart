import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Icon? prefixIcon;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final int boxsize;

  final bool obscureText;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.validator,
    this.prefixIcon,
    required this.boxsize,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: obscureText,
        obscuringCharacter: '*',
        validator: validator,
        controller: controller,
        maxLines: obscureText ? 1 : boxsize,
        keyboardType: obscureText
            ? TextInputType.visiblePassword
            : TextInputType.multiline,
        style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 0.7),
            fontSize: screenWidth(30),
            fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          prefixIconColor: AppColors.purplelightColor,
          prefixIcon: prefixIcon,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.purpleColor, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.purpleColor, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.purplelightColor,
            fontWeight: FontWeight.w300,
            fontSize: screenWidth(30),
          ),
          fillColor: AppColors.skyColor,
          filled: true,
          contentPadding: EdgeInsets.symmetric(
              vertical: screenWidth(20), horizontal: screenWidth(20)),
          errorStyle: TextStyle(
              color: AppColors.purpleColor, fontSize: screenWidth(30)),
        ));
  }
}
