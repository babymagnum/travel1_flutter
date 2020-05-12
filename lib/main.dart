import 'package:dribbble_clone/core/helper/constant.dart';
import 'package:dribbble_clone/core/helper/locator.dart';
import 'package:dribbble_clone/core/helper/router.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

final globalNavigatorKey = GlobalKey<NavigatorState>();
final FirebaseMessaging firebaseMessaging = FirebaseMessaging();

getFcmToken() {
  firebaseMessaging.getToken().then((String token) {
    assert(token != null);
    print("FCM_TOKEN $token");

    SharedPreferences.getInstance().then((preference) {
      preference.setString(Constant.FCM_TOKEN, token);
    });
  });
}

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) {
  print('onBackground: $message');
  return Future<void>.value();
}

class MyApp extends StatefulWidget {

  // Don't forget to change BASE_API to Constant.API_PRODUCTION when building apk / when testing live server //
  static const BASE_API = Constant.API_PRODUCTION;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {

    _fcmListener();

    super.initState();
  }

  _fcmListener() {
    firebaseMessaging.requestNotificationPermissions(IosNotificationSettings(sound: true, badge: true, alert: true));
    firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
    firebaseMessaging.onTokenRefresh.listen((newFCMToken) {
      // do something if token refresh
    });

    getFcmToken();
  }

  @override
  Widget build(BuildContext context) {
    // this code to make apps to only allows portrait mode //
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      title: 'Travel App',
      navigatorKey: globalNavigatorKey,
      initialRoute: Router.initialRoute,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Router.generateRoute,
    );
  }
}
