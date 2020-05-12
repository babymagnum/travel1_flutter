import 'package:dribbble_clone/core/theme/dimens.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'stores/travel_stores.dart';

class TravelView extends StatefulWidget {
  @override
  _TravelViewState createState() => _TravelViewState();
}

class _TravelViewState extends State<TravelView> {

  var _travelStores = GetIt.I.get<TravelStores>();

  List<Widget> listRegion() {
    var listData = ['Asia', 'Europe', 'East', 'Africa'];
    var listWidget = List<Widget>();
    for (int i=0; i<listData.length; i++) {
      listWidget.add(GestureDetector(
        onTap: () => _travelStores.setIndexRegion(i),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 5.h),
          margin: EdgeInsets.only(left: i == 0 ? 20.h : 6.h, right: i == listData.length - 1 ? 20.h : 4.h, top: 10.h, bottom: 10.h),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.19), offset: Offset(0, 3), blurRadius: 5)
            ],
            borderRadius: BorderRadius.circular(Dimens.half_circle),
            color: i == _travelStores.indexRegion ? Color(0xFF6200EE) : Color(0xFFF1F1F1)
          ),
          child: Text(listData[i], style: ThemeTextStyle.poppinsMedium.apply(color: i == _travelStores.indexRegion ? Colors.white : Colors.black, fontSizeDelta: 12.ssp),),
        ),
      ));
    }

    return listWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h + MediaQuery.of(context).padding.top,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Row(
                  children: [
                    Expanded(
                      child: Text('Enjoy your life with us!', style: ThemeTextStyle.openSansBold.apply(fontSizeDelta: 20.ssp, color: Color(0xFF24253D)),)
                    ),
                    SizedBox(width: 10.h,),
                    Image.asset('assets/images/ic_search.png', height: 17.h, width: 17.h, color: Color(0xFF24253D),)
                  ],
                ),
              ),
              SizedBox(height: 20.h,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: listRegion(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
