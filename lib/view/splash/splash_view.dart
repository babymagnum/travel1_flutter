import 'package:dribbble_clone/core/helper/constant.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/view/home/home_view.dart';
import 'package:dribbble_clone/view/start/start_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {

  static const routeName = "splash_view";

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {

    Future.delayed(Duration(seconds: 1), () {
      SharedPreferences.getInstance().then((preference) {
        final isLogin = preference.getBool(Constant.IS_LOGIN) ?? false;
        if (isLogin) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeView()));
        } else {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => StartView()));
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    //If you want to set the font size is scaled according to the system's "font size" assist option
    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: true);

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
                  ),)
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}
