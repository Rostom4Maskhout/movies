import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

typedef Validation = void Function(String)?;
typedef Validator = String? Function(String?)?;

class CustomTextField extends StatelessWidget {
  Color? borderSide;
  Color? fillColor;
  bool? filled;
  String? hintText;
  TextStyle? hintStyle;
  String? labelText;
  TextStyle? labelStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;
  int? maxLines;
  TextEditingController? controller;
  Validation? onChanged;
  Validator? validator;
  bool obscureText;
  String obscuringCharacter;

  CustomTextField({
    super.key,
    this.fillColor,
    this.borderSide,
    this.filled,
    this.hintText,
    this.hintStyle,
    this.labelText,
    this.labelStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines,
    this.controller,
    this.onChanged,
    this.validator,
    this.obscureText = false,
    this.obscuringCharacter = '.',
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter,
      style: AppStyles.regular16White,
      decoration: InputDecoration(
        enabledBorder: buildDecorationBorder(
          borderSide: borderSide ?? Colors.transparent,
        ),
        focusedBorder: buildDecorationBorder(
          borderSide: borderSide ?? Colors.transparent,
        ),
        fillColor: fillColor,
        filled: filled,

        errorStyle: TextStyle(fontSize: 16, color: AppColors.redColor),
        errorBorder: buildDecorationBorder(borderSide: AppColors.redColor),
        focusedErrorBorder: buildDecorationBorder(
          borderSide: AppColors.redColor,
        ),
        hintText: hintText,
        hintStyle: hintStyle,
        labelText: labelText,
        labelStyle: labelStyle,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }

  OutlineInputBorder buildDecorationBorder({required Color borderSide}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: borderSide),
    );
  }
}
