import 'package:division/division.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/view/signin/signin_view.dart';
import 'package:dribbble_clone/view/signup/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height, width: size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/image_1.png')
              )
            ),
          ),
          Positioned(
            left: 0, right: 0, top: 0, bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.center,
              color: Colors.black.withOpacity(0.3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Explore the world', style: ThemeTextStyle.openSansSemiBold.apply(
                    fontSizeDelta: 30.ssp, color: Colors.white
                  ),),
                  SizedBox(height: 17.h,),
                  Text('Travel with people. Make new friends.', style: ThemeTextStyle.openSansRegular.apply(
                    fontSizeDelta: 15.ssp, color: Colors.white
                  ),),
                  SizedBox(height: 292.h,),
                  Parent(
                    gesture: Gestures()..onTap(() => Navigator.of(context).push(MaterialPageRoute(builder: (_) => SigninView()))),
                    style: ParentStyle()..ripple(true)..borderRadius(all: 5)..boxShadow(color: Colors.black.withOpacity(0.16), offset: Offset(1, 3), blur: 15)
                      ..background.color(Colors.white)..padding(vertical: 11.h)..width(size.width)..margin(horizontal: 38.h),
                    child: Text('SIGN IN', textAlign: TextAlign.center, style: ThemeTextStyle.openSansBold.apply(color: Color(0xFF6200EE), fontSizeDelta: 20.ssp),),
                  ),
                  SizedBox(height: 20.h,),
                  Parent(
                    gesture: Gestures()..onTap(() => Navigator.of(context).push(MaterialPageRoute(builder: (_) => SignupView()))),
                    style: ParentStyle()..ripple(true)..borderRadius(all: 5)..boxShadow(color: Colors.black.withOpacity(0.16), offset: Offset(1, 3), blur: 15)
                      ..background.color(Color(0xFF6200EE))..padding(vertical: 11.h)..width(size.width)..margin(horizontal: 38.h),
                    child: Text('SIGN UP', textAlign: TextAlign.center, style: ThemeTextStyle.openSansBold.apply(color: Colors.white, fontSizeDelta: 20.ssp),),
                  )
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}
