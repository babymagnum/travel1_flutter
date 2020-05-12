import 'dart:io';

import 'package:dribbble_clone/view/screen1/screen1_view.dart';
import 'package:dribbble_clone/view/screen2/screen2_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../core/theme/theme_color.dart';
import '../../core/theme/theme_text_style.dart';
import '../../main.dart';

class HomeView extends StatefulWidget {

  static const routeName = 'home_view';

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  var selectedIndex = 0;
  List<Widget> _listScreen = [Screen1View(), Screen2View()];

  onItemTapped(int index) async {
    if (index == 3) {
      // do something
    } else {
      setState(() => selectedIndex = index);
    }
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
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              size: 20,
              color: selectedIndex == 0 ? ThemeColor.orange : ThemeColor.dark_grey,
            ),
            title: Padding(
              padding: EdgeInsets.only(top: 3),
              child: Text(
                'Screen 1',
                style: ThemeTextStyle.poppinsRegular.apply(
                  fontSizeDelta: -6, color: selectedIndex == 0 ? ThemeColor.orange : ThemeColor.dark_grey,
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              size: 20,
              color: selectedIndex == 1 ? ThemeColor.orange : ThemeColor.dark_grey,
            ),
            title: Padding(
              padding: EdgeInsets.only(top: 3),
              child: Text(
                'Screen 2',
                style: ThemeTextStyle.openSansRegular.apply(
                  fontSizeDelta: -6, color: selectedIndex == 1 ? ThemeColor.orange : ThemeColor.dark_grey,
                ),
              ),
            ),
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: ThemeColor.orange,
        onTap: onItemTapped,
      ),
    );
  }
}
