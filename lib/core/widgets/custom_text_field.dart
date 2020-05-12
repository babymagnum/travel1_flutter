import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    @required this.inputType,
    @required this.hintText,
    @required this.onEditingComplete,
    @required this.onChanged,
    this.focusNode,
    @required this.textInputAction,
    @required this.isMasked,
    this.textEditingController,
    this.isObsecure,
    this.textStyle,
    this.hintTextStyle,
    this.fillColor,
    this.borderRadius
  });

  final bool isObsecure;
  final bool isMasked;
  final TextInputType inputType;
  final String hintText;
  final Function onEditingComplete;
  final Function(String) onChanged;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final TextEditingController textEditingController;
  final TextStyle textStyle;
  final TextStyle hintTextStyle;
  final Color fillColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: isMasked ? textEditingController : null,
      onChanged: onChanged,
      focusNode: focusNode,
      onEditingComplete: onEditingComplete,
      keyboardType: inputType,
      maxLines: inputType == TextInputType.multiline ? null : 1,
      textInputAction: textInputAction,
      style: textStyle,
      obscureText: isObsecure != null ? true : false,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        hintText: hintText,
        hintStyle: hintTextStyle,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: fillColor, width: 1,),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 17.h),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: fillColor, width: 1,),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
    );
  }
}