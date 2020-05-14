import 'package:division/division.dart';
import 'package:dribbble_clone/core/theme/dimens.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/core/widgets/measure_size.dart';
import 'package:dribbble_clone/core/widgets/page_indicator.dart';
import 'package:dribbble_clone/core/widgets/placeholder_network_image.dart';
import 'package:dribbble_clone/model/travel_view_pager_model.dart';
import 'package:flutter/cupertino.dart';
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

  var _selectedPager = 0;
  var _travelStores = GetIt.I.get<TravelStores>();
  var _listPagerData = [
    TravelViewPagerModel('https://assets.anantara.com/image/upload/q_auto,f_auto/media/minor/anantara/images/anantara-uluwatu-bali-resort/the-resort/anantara_uluwatu_exterior_944x510.jpg?h=510&w=944&la=en', 'Indonesia', 'Bali Tanah Dewata Asri', ['https://themes.themewaves.com/nuzi/wp-content/uploads/sites/4/2013/05/Team-Member-3.jpg', 'https://themes.themewaves.com/nuzi/wp-content/uploads/sites/4/2013/05/Team-Member-3.jpg', 'https://themes.themewaves.com/nuzi/wp-content/uploads/sites/4/2013/05/Team-Member-3.jpg', 'https://themes.themewaves.com/nuzi/wp-content/uploads/sites/4/2013/05/Team-Member-3.jpg', 'https://themes.themewaves.com/nuzi/wp-content/uploads/sites/4/2013/05/Team-Member-3.jpg'], 5),
    TravelViewPagerModel('https://www.telegraph.co.uk/content/dam/Travel/Destinations/Asia/Thailand/Phuket/phuket-thailand-beach-boat-lead-main-guide.jpg', 'Thailand', 'Phuket Skidipapap Swadikap', ['https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/140120_Minho_Lee_c.jpg/220px-140120_Minho_Lee_c.jpg'], 4.3),
    TravelViewPagerModel('https://res-1.cloudinary.com/enchanting/f_auto/et-web/2015/05/Enchanting-Travels-Vietnam-Tours-pagoda-of-Tran-Quoc-temple-in-Hanoi-Vietnam.jpg', 'Vietnam', 'Hanoi Cimol Aloy Alibaba Wushian', ['https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/140120_Minho_Lee_c.jpg/220px-140120_Minho_Lee_c.jpg'], 4.2),
    TravelViewPagerModel('https://static.asiawebdirect.com/m/kl/portals/kuala-lumpur-ws/homepage/pagePropertiesOgImage/kuala-lumpur.jpg.jpg', 'Malaysia', 'Kuala Lumpur Malaysia', ['https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/140120_Minho_Lee_c.jpg/220px-140120_Minho_Lee_c.jpg'], 3.8),
  ];

  List<Widget> listStar(int size) {
    List<Widget> listWidget = List();
    for (int i=0; i<5; i++) {
      listWidget.add(Image.asset('assets/images/ic_star.png', width: 9.h, height: 9.h, color: i <= size ? Color(0xFFFFAA00) : Color(0xFF95989A)));
    }
    return listWidget;
  }

  List<Widget> listPeople(List<String> listPeople) {
    List<Widget> listWidget = List();
    for (int i=0; i<listPeople.length; i++) {
      if (i == 4) {
        break;
      } else if (i == 3) {
        listWidget.add(
          Container(
            margin: EdgeInsets.only(left: 11.5 * i),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(1, 3),
                  blurRadius: 6
                )
              ],
              border: Border.all(
                color: Colors.white,
                width: 2
              ),
              borderRadius: BorderRadius.circular(Dimens.half_circle)
            ),
            child: Stack(
              children: [
                PlaceholderNetworkImage(
                  url: listPeople[i], size: Size(30.h, 30.h), borderRadius: Dimens.half_circle,
                ),
                listPeople.length - 4 == 0 ? Container() :
                Container(
                  width: 30.h, height: 30.h,
                  decoration: BoxDecoration(
                    color: Color(0xFF6200EE).withOpacity(0.71),
                    borderRadius: BorderRadius.all(Radius.circular(Dimens.half_circle))
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text('${listPeople.length - 4}+', style: ThemeTextStyle.openSansRegular.apply(color: Colors.white, fontSizeDelta: 9.ssp),),
                  ),
                )
              ],
            ),
          )
        );
      } else {
        listWidget.add(
          Container(
            margin: EdgeInsets.only(left: 11.5 * i),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(1, 3),
                  blurRadius: 6
                )
              ],
              border: Border.all(
                color: Colors.white,
                width: 2
              ),
              borderRadius: BorderRadius.circular(Dimens.half_circle)
            ),
            child: PlaceholderNetworkImage(
              url: listPeople[i], size: Size(30.h, 30.h), borderRadius: Dimens.half_circle,
            ),
          )
        );
      }
    }

    return listWidget;
  }

  List<Widget> listPager(Size size) {
    List<Widget> listWidget = List();
    for (int i=0; i<_listPagerData.length; i++) {
      listWidget.add(
        Parent(
          style: ParentStyle()..margin(horizontal: 29, bottom: 5)..background.color(Colors.white)..boxShadow(color: Colors.black.withOpacity(0.08), offset: Offset(1, 3), blur: 6)..borderRadius(all: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: size.width, height: 170.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(_listPagerData[i].image)
                    )
                  ),
                ),
              ),
              SizedBox(height: 14.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 17),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Flexible(
                                child: Text(_listPagerData[i].name, maxLines: 1, overflow: TextOverflow.ellipsis, style: ThemeTextStyle.openSansBold.apply(fontSizeDelta: 14.ssp, color: Colors.black),)
                              ),
                              SizedBox(width: 10.h,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: listStar(_listPagerData[i].star.toInt()),
                              )
                            ],
                          ),
                          SizedBox(height: 2.h),
                          Text(_listPagerData[i].country, style: ThemeTextStyle.openSansSemiBold.apply(fontSizeDelta: 9.ssp, color: Color(0xFF707070).withOpacity(0.53)),)
                        ],
                      ),
                    ),
                    SizedBox(width: 10.h,),
                    Stack(
                      children: listPeople(_listPagerData[i].peoples),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      );
    }

    return listWidget;
  }
  
  List<Widget> listRegion() {
    var listData = ['Asia', 'Europe', 'East', 'Africa', 'Souteast Asia'];
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

  List<Widget> pageIndicators() {
    List<Widget> listWidget = List();

    for(int i=0; i<_listPagerData.length; i++) {
      listWidget.add(PageIndicator(
        height: 5,
        isSelected: _selectedPager == i,
        color: _selectedPager == i ? Color(0xFF6200EE) : Color(0xFF707070),
        isFirst: i == 0,
        isLast: i == _listPagerData.length -1,
      ));
    }

    return listWidget;
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Observer(
        builder: (_) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h + MediaQuery.of(context).padding.top,),
              MeasureSize(
                onChange: (Size size) {
                  print('enjoy life height ${size.height}');
                },
                child: Padding(
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
              ),
              SizedBox(height: 20.h,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: listRegion(),
                ),
              ),
              SizedBox(height: 35.h,),
              Container(
                height: 205, width: size.width,
                child: PageView(
                  onPageChanged: (value) => setState(() => _selectedPager = value),
                  children: listPager(size),
                ),
              ),
              SizedBox(height: 17.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: pageIndicators(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
