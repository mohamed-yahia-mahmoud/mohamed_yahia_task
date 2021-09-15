import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mohamed_yahia_task/calendar/airfare.dart';
import 'package:mohamed_yahia_task/mobx/HomeMobx.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

import 'home.dart';

class Details extends StatefulWidget {
  const Details({key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  HomeMobx con;

  @override
  void initState() {
     WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        con.startDate!=null&&con.endDate!=null?con.calcAmount():print("");
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    con.controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    con=Provider.of<HomeMobx>(context);

    return WillPopScope(
      onWillPop: ()  {
        Navigator.pop(context);
      },
      child: Scaffold(
        body:
        Container(
        child:  Column(

                    children: [

                      /// check in and check out buttons
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 35.0, left: 16, right: 16, bottom: 8),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {
                                setState(() {
                                    con.isStartDay=false;
                                    con.checkInTapped=!con.checkInTapped;
                                    Toast.show("pls select your Start date from calender by tapping the suitable date cell", context, duration: Toast.LENGTH_LONG, gravity:  Toast.TOP);
                               });
                                        },
                                child: Container(
                                  width: MediaQuery.of(context).size.width*.4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: con.checkInTapped?Colors.green:Colors.white,
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text("Check-In date", style: TextStyle(
                                        color: con.checkInTapped?Colors.white:Colors.black.withOpacity(.7), fontSize: 14,),),
                                    ),
                                  ),
                                ),
                              ),

                              InkWell(
                                onTap: () {
                                 setState(() {
                                    con.isEndDay=false;
                                    con.checkOutTapped=!con.checkOutTapped;
                                    Toast.show("pls select your End date from calender by tapping the suitable date cell", context, duration: Toast.LENGTH_LONG, gravity:  Toast.TOP);
                                 });

                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width*.4,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: con.checkOutTapped?Colors.green:Colors.white,
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text("Check-Out date", style: TextStyle(
                                        color: con.checkOutTapped?Colors.white:Colors.black.withOpacity(.7), fontSize: 14,),),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 10,),



                      /// custom calender
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey.withOpacity(.2),
                          ),
                          width:  MediaQuery.of(context).size.width*.9,
                          height:  MediaQuery.of(context).size.height*.6,
                          child: AirFareCalendar( ) ,
                        ),
                      ),

                      con.endDate!=null&&con.endDate!=null?
                      Column(
                        children: [
                          /// number of nights
                          Padding(
                              padding: const EdgeInsets.only(left: 20.0,top: 20),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '${con.endDate.difference(con.startDate).inDays} Nights ',//
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                          ),

                          /// total cost
                          Padding(
                              padding: const EdgeInsets.only(left: 20.0,top: 8),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Total amount ${con.amount} EGP',//
                                  style: TextStyle(
                                    color: Colors.green.withOpacity(.7),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                          ),

                          /// average per night
                          Padding(
                              padding: const EdgeInsets.only(left: 20.0,top: 8),
                              child: Container(
                                alignment: Alignment.topLeft,
                                child: RichText(
                                  textAlign: TextAlign.start,
                                  text: TextSpan(
                                    text: '${(con.amount/con.endDate.difference(con.startDate).inDays).round()} EGP/',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    children: const <TextSpan>[
                                      TextSpan(text: 'night', style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10.0,
                                      )),
                                    ],
                                  ),
                                ),
                              )
                          ),
                        ],
                      ):Container(),




                    ],
                  ),

      )),
    );
  }
}
