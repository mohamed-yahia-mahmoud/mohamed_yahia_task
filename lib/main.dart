/* import 'package:flutter/material.dart';

import 'HomeScreen.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}*/




import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mohamed_yahia_task/home.dart';
import 'package:mohamed_yahia_task/mobx/HomeMobx.dart';
import 'package:provider/provider.dart';

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


          // for testing ocr call MyHomePage
          home: new  Home() ,
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
