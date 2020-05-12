import 'dart:io';

import 'package:dribbble_clone/model/bottom_navigation_model.dart';
import 'package:dribbble_clone/view/chatbot/chatbot_view.dart';
import 'package:dribbble_clone/view/flights/flights_view.dart';
import 'package:dribbble_clone/view/hotels/hotels_view.dart';
import 'package:dribbble_clone/view/profile/profile_view.dart';
import 'package:dribbble_clone/view/travel/travel_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../core/theme/theme_color.dart';
import '../../core/theme/theme_text_style.dart';
import '../../main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatefulWidget {

  static const routeName = 'home_view';

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  var selectedIndex = 0;
  List<Widget> _listScreen = [TravelView(), FlightsView(), ChatbotView(), HotelsView(), ProfileView()];

  onItemTapped(int index) async {
//    if (index == 3) {
//      // do something
//    } else {
//      setState(() => selectedIndex = index);
//    }
    setState(() => selectedIndex = index);
  }

  @override
  void initState() {
    _fcmListener();

    super.initState();
  }

  _onSelectNotification(String payload) async {
    print('notification clicked $payload');
    //await Navigator.of(context).push(MaterialPageRoute(builder: (_) => BuildingView()));
  }

  _showNotification(Map<String, dynamic> message) async {
    var initializationSettingsAndroid = AndroidInitializationSettings('logo_agen_parkir');
    var initializationSettingsIOS = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(initializationSettingsAndroid, initializationSettingsIOS);
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: (payload) => _onSelectNotification(payload));

    String title;
    String body;

    title = message['data']['title'];
    body = message['data']['body'];

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'agen_parkir', 'agen_parkir', 'agen_parkir',
      importance: Importance.Max, priority: Priority.High);
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
      androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: '$title:$body'
    );
  }

  _fcmListener() {
    firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        if (Platform.isAndroid) _showNotification(message);
        print("onMessage: $message");
      },
      /// Android : Fired when notification clicked and the apps is killed
      onLaunch: (Map<String, dynamic> message) async {
        if (Platform.isAndroid) _showNotification(message);
        print("onLaunch: $message");
        //await Navigator.push(context, MaterialPageRoute(builder: (_) => BuildingView()));
      },
      /// Fired when notification clicked and apps is in background
      onResume: (Map<String, dynamic> message) async {
        if (Platform.isAndroid) _showNotification(message);
        print("onResume: $message");
        //await Navigator.push(context, MaterialPageRoute(builder: (_) => BuildingView()));
      },
      onBackgroundMessage: Platform.isIOS ? null : myBackgroundMessageHandler,
    );
  }

  List<BottomNavigationBarItem> bottomNavigationList() {
    var listData = [
      BottomNavigationModel('Travel', 'assets/images/ic_travel.png'),
      BottomNavigationModel('Flights', 'assets/images/ic_flights.png'),
      BottomNavigationModel('Chatbot', 'assets/images/ic_chatbot.png'),
      BottomNavigationModel('Hotels', 'assets/images/ic_hotels.png'),
      BottomNavigationModel('Profile', 'assets/images/ic_hotels.png'),
    ];
    var listWidget = List<BottomNavigationBarItem>();

    for (int i=0; i<listData.length; i++) {
      listWidget.add(BottomNavigationBarItem(
        icon: Image.asset(listData[i].image, height: i == 1 ? 22.h : 22.h, width: i == 1 ? 26.w : 22.w, color: selectedIndex == i ? Color(0xFF6200EE) : Color(0xFF8C8C98)),
        title: Padding(
          padding: EdgeInsets.only(top: 4.h),
          child: Text(
            listData[i].text,
            style: ThemeTextStyle.openSansRegular.apply(
              fontSizeDelta: 10.ssp, color: selectedIndex == i ? Color(0xFF6200EE) : Color(0xFF8C8C98),
            ),
          ),
        ),
      ));
    }

    return listWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: _listScreen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: bottomNavigationList(),
        currentIndex: selectedIndex,
        selectedItemColor: ThemeColor.orange,
        onTap: onItemTapped,
      ),
    );
  }
}
