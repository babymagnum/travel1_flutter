import 'package:division/division.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordView extends StatefulWidget {
  @override
  _ResetPasswordViewState createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 72.h + MediaQuery.of(context).padding.top,),
              Icon(Icons.arrow_back, color: Color(0xFF6200EE), size: 20.h),
              SizedBox(height: 40.h,),
              Text('Reset your password', style: ThemeTextStyle.openSansRegular.apply(fontSizeDelta: 30.ssp, color: Color(0xFF24253D)),),
              SizedBox(height: 40.h,),
              CustomTextField(inputType: TextInputType.emailAddress, hintText: 'Email Address', onEditingComplete: () => FocusScope.of(context).requestFocus(FocusNode()), onChanged: (text) {}, textInputAction: TextInputAction.done, isMasked: false,
                borderRadius: 5, fillColor: Color(0xFFF5F5F5), textStyle: ThemeTextStyle.openSansRegular.apply(fontSizeDelta: 16.ssp, color: Color(0xFF24253D)), hintTextStyle: ThemeTextStyle.openSansRegular.apply(fontSizeDelta: 16.ssp, color: Color(0xFF24253D).withOpacity(0.3)),),
              SizedBox(height: 43.h,),
              Parent(
                gesture: Gestures()..onTap(() {}),
                style: ParentStyle()..ripple(true)..borderRadius(all: 5)..boxShadow(color: Colors.black.withOpacity(0.16), offset: Offset(1, 3), blur: 15)
                  ..background.color(Color(0xFF6200EE))..padding(vertical: 11.h)..width(size.width),
                child: Text('Reset your password', textAlign: TextAlign.center, style: ThemeTextStyle.openSansBold.apply(color: Colors.white, fontSizeDelta: 20.ssp),),
              ),
              SizedBox(height: 20.h,),
            ],
          ),
        ),
      ),
    );
  }
}
