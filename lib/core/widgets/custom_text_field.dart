import 'package:dribbble_clone/core/theme/theme_color.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:flutter/material.dart';

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
    this.isObsecure
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
      style: ThemeTextStyle.ubuntuRegular.apply(fontSizeDelta: -2),
      obscureText: isObsecure != null ? true : false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: ThemeTextStyle.ubuntuRegular
          .apply(fontSizeDelta: -2, color: ThemeColor.lightGrey1),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ThemeColor.green,
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 13),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black12, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
    );
  }
}