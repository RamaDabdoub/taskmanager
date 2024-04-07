
import 'package:empty_code/ui/shared/colors.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  final Icon? prefixIcon;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final double? boxsize;

  final bool obscureText;
 
  const CustomTextField(
      {super.key,
      required this.hintText,
      this.controller,
      this.validator, this.prefixIcon, this.boxsize,   this.obscureText=false,
      });

  @override
  Widget build(BuildContext context) {
    
    return Container(
         width: screenWidth(1),
      height:boxsize?? screenWidth(6.3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.whiteColor,
        border: Border.all(
          color: AppColors.purpleColor.withOpacity(0.5),
          width: 2,
        ),
      ),
      child: TextFormField(
      obscureText: obscureText,
          validator: validator,
          controller: controller,
          //  maxLines: null,
          // keyboardType:obscureText? TextInputType.none:TextInputType.multiline,
          style: TextStyle(color:Color.fromRGBO(0, 0, 0, 0.7),fontSize: screenWidth(30),fontWeight: FontWeight.w400),
          decoration: InputDecoration(
            
            prefixIconColor: AppColors.purplelightColor,
            prefixIcon: prefixIcon,
           
          
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.skyColor, width: 2),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.skyColor, width: 2),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              
              color: AppColors.purplelightColor,
              fontWeight: FontWeight.w300,
              fontSize: screenWidth(30),
            ),
            fillColor: AppColors.whiteColor,
            filled: true,
            contentPadding: EdgeInsets.symmetric(
                vertical: screenWidth(20), horizontal: screenWidth(20)),
            errorStyle:
                TextStyle(color: AppColors.purpleColor, fontSize: screenWidth(30)),
              
          
         
         
          )),
    );
  }
}
