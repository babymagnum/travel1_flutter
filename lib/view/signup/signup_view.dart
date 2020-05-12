import 'package:division/division.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/core/widgets/custom_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupView extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {

  var _emailFocus = FocusNode(), _passwordFocus = FocusNode();

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
              Text('Create New Account', style: ThemeTextStyle.openSansRegular.apply(fontSizeDelta: 30.ssp, color: Color(0xFF24253D)),),
              SizedBox(height: 40.h,),
              CustomTextField(inputType: TextInputType.text, hintText: 'Name', onEditingComplete: () => FocusScope.of(context).requestFocus(_emailFocus), onChanged: (text) {}, textInputAction: TextInputAction.next, isMasked: false,
                borderRadius: 5, fillColor: Color(0xFFF5F5F5), textStyle: ThemeTextStyle.openSansRegular.apply(fontSizeDelta: 16.ssp, color: Color(0xFF24253D)), hintTextStyle: ThemeTextStyle.openSansRegular.apply(fontSizeDelta: 16.ssp, color: Color(0xFF24253D).withOpacity(0.3)),),
              SizedBox(height: 20.h,),
              CustomTextField(inputType: TextInputType.emailAddress, hintText: 'Email Address', onEditingComplete: () => FocusScope.of(context).requestFocus(_passwordFocus), onChanged: (text) {}, textInputAction: TextInputAction.next, isMasked: false,
                borderRadius: 5, fillColor: Color(0xFFF5F5F5), textStyle: ThemeTextStyle.openSansRegular.apply(fontSizeDelta: 16.ssp, color: Color(0xFF24253D)), hintTextStyle: ThemeTextStyle.openSansRegular.apply(fontSizeDelta: 16.ssp, color: Color(0xFF24253D).withOpacity(0.3)),
                focusNode: _emailFocus,),
              SizedBox(height: 20.h,),
              CustomTextField(inputType: TextInputType.text, hintText: 'Password', onEditingComplete: () => FocusScope.of(context).requestFocus(FocusNode()), isObsecure: true, onChanged: (text) {}, textInputAction: TextInputAction.done, isMasked: false,
                borderRadius: 5, fillColor: Color(0xFFF5F5F5), textStyle: ThemeTextStyle.openSansRegular.apply(fontSizeDelta: 16.ssp, color: Color(0xFF24253D)), hintTextStyle: ThemeTextStyle.openSansRegular.apply(fontSizeDelta: 16.ssp, color: Color(0xFF24253D).withOpacity(0.3)),
                focusNode: _passwordFocus,),
              SizedBox(height: 43.h,),
              Parent(
                gesture: Gestures()..onTap(() {}),
                style: ParentStyle()..ripple(true)..borderRadius(all: 5)..boxShadow(color: Colors.black.withOpacity(0.16), offset: Offset(1, 3), blur: 15)
                  ..background.color(Color(0xFF6200EE))..padding(vertical: 11.h)..width(size.width),
                child: Text('SIGN UP', textAlign: TextAlign.center, style: ThemeTextStyle.openSansBold.apply(color: Colors.white, fontSizeDelta: 20.ssp),),
              ),
              SizedBox(height: 20.h,),
              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    text: 'Already have an account?  ',
                    style: ThemeTextStyle.openSansRegular.apply(fontSizeDelta: (11.5).ssp, color: Color(0xFF24253D)),
                    children: [
                      TextSpan(
                        text: 'SIGN IN',
                        style: ThemeTextStyle.openSansRegular.apply(fontSizeDelta: (11.5).ssp, color: Color(0xFF6200EE)),
                        recognizer: TapGestureRecognizer()..onTap = () => print('Tap Here onTap')
                      )
                    ]
                  ),
                )
              ),
              SizedBox(height: 20.h,)
            ],
          ),
        ),
      ),
    );
  }
}
