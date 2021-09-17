
import 'dart:io';

import 'package:flutter/material.dart';
 import 'package:mohamed_yahia_task/mobx/HomeMobx.dart';
import 'package:mohamed_yahia_task/screens/home.dart';
import 'package:mohamed_yahia_task/screens/intro/start_page.dart';
import 'package:provider/provider.dart';

import 'calendar/RentingCalendar.dart';

class RIKeys {
  static final riKey1 = const Key('__RIKEY1__');
  static final riKey2 = const Key('__RIKEY2__');
  static final riKey3 = const Key('__RIKEY3__');
}

Future<void> main()  {
  HttpOverrides.global = new MyHttpOverrides();

  Future.delayed(
      Duration(milliseconds: 50),
          () => runApp(
        MyApp(),
      ));
}

class MyApp extends StatefulWidget {



  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var image;

  final navigatorKey = GlobalKey<NavigatorState>();


  @override
  Widget build(BuildContext context) {



    return MultiProvider(
        providers: [
          Provider<HomeMobx>(create: (_) => HomeController()),
        ],
        child :  MaterialApp(
          debugShowCheckedModeBanner: false,

          home: new StartPage() ,
          navigatorKey: navigatorKey,

        )
    );


  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

