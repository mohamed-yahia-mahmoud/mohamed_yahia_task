import 'package:flutter/material.dart';
import 'package:mohamed_yahia_task/calendar/airfare.dart';

class Details extends StatefulWidget {
  const Details({key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        child: Column(

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

                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width*.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.green,
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text("Check-In date", style: TextStyle(
                              color: Colors.black.withOpacity(.7), fontSize: 14,),),
                          ),
                        ),
                      ),
                    ),

                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width*.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.amber,
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text("Check-Out date", style: TextStyle(
                              color: Colors.black.withOpacity(.7), fontSize: 14,),),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height:   MediaQuery.of(context).size.height*.05,
            ),

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
            )


          ],
        ),
      ),
    );
  }
}
