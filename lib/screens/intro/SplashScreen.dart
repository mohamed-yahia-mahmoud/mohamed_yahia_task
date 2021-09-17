import 'dart:core';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mohamed_yahia_task/mobx/HomeMobx.dart';
import 'package:mohamed_yahia_task/screens/home.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  final int seconds;
  final Text title;
  final Color backgroundColor;
  final TextStyle styleTextUnderTheLoader;
  final dynamic navigateAfterSeconds;
  final double photoSize;
  final dynamic onClick;
  final Color loaderColor;
  final Image image;
  final Text loadingText;
  final ImageProvider imageBackground;
  final Gradient gradientBackground;
  SplashScreen(
      {
        this.loaderColor,
        @required this.seconds,
        this.photoSize,
        this.onClick,
        this.navigateAfterSeconds,
        this.title = const Text(''),
        this.backgroundColor = Colors.white,
        this.styleTextUnderTheLoader = const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black
        ),
        this.image,
        this.loadingText  = const Text(""),
        this.imageBackground,
        this.gradientBackground
      }
      );


  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  HomeMobx con;



  @override
  void initState() {


    WidgetsBinding.instance.addPostFrameCallback((_) async{
      /// for getting data from api during splash screen
      await con.newRequestsMethod( context: context);
    });

    super.initState();
    Timer(
        Duration(seconds: widget.seconds),
            () {
            Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (BuildContext context) => Home()));
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    con=Provider.of<HomeMobx>(context);

    return Scaffold(
      body: new InkWell(
        onTap: widget.onClick,
        child:new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                image: widget.imageBackground == null
                    ? null
                    : new DecorationImage(
                  fit: BoxFit.cover,
                  image: widget.imageBackground,
                ),
                gradient: widget.gradientBackground,
                color: widget.backgroundColor,
              ),
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                  child: new Container(
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: new Container(
                                child: widget.image
                            ),
                            radius: widget.photoSize,
                          ),
                          new Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                          ),
                          widget.title
                        ],
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
