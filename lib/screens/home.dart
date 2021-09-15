import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
 import 'package:mohamed_yahia_task/mobx/HomeMobx.dart';
import 'package:mohamed_yahia_task/screens/Details.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {

     Home({  key,items}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  int _current = 0;

  int index=0;

  HomeMobx con;



  @override
  void initState() {
    // TODO: implement initState

    WidgetsBinding.instance.addPostFrameCallback((_) async{
      await con.newRequestsMethod( context: context);
    });
    super.initState();
  }

  @override
  void dispose() {
     super.dispose();
  }

  Widget build(BuildContext context) {

    con=Provider.of<HomeMobx>(context);

    final List<Widget> imageSliders =  con.myImgs.map((item) => Container(
  child: Container(
    height: 800,
    margin: EdgeInsets.all(5.0),
    child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            Image.network(item, fit: BoxFit.cover, width: 1000.0),
            Positioned(
              top: 0.0,
              left: 0.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(13),

                  ),
                  //padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0,vertical: 3),
                    child: Text(
                      'AVAILABLE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),



          ],
        )
    ),
  ),
)).toList();

    return Scaffold(
      body:
       Container(
        child: Column(

          children: [

            /// the date and filter part
            Padding(
              padding: const EdgeInsets.only(
                  top: 35.0, left: 16, right: 25, bottom: 8),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text("Add Dates  ", style: TextStyle(
                        color: Colors.grey.withOpacity(.7), fontSize: 25,),),
                    ),
                    Text(" | ", style: TextStyle(
                      color: Colors.grey.withOpacity(.2), fontSize: 25,)),

                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.filter_alt,
                        color: Colors.black.withOpacity(.8),
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),


            /// the card and its content
            InkWell(
              onTap: (){
                con.fares.add('the dates ${con.myProperties[con.current].prices}');
                print(con.myProperties[con.current].prices.i10_01_2021);
                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Details()));
              },
              child: Stack(
                  children: [
                    CarouselSlider(
                      items: imageSliders,
                      options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 2.0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              con.current =  index;
                            });
                          }
                      ),
                    ),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: con.myImgs.map((url) {
                           index = con.myImgs.indexOf(url);
                          return Container(
                            width: 8.0,
                            height: 8.0,
                            margin: EdgeInsets.symmetric(vertical: 10.0,
                                horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: con.current ==  index
                                  ? Colors.green
                                  : Colors.white,
                            ),
                          );
                        }).toList(),
                      ),
                    ),


                  ]
              ),
            ),

            /// the name of each flat under the card
            Padding(
                padding: const EdgeInsets.only(left: 44.0,top: 8),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${con.myProperties!=null&&con.myProperties.length!=0?con.myProperties[con.current].name:""}',//
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
            ),


            /// num of each bedroom and bathroom in any flat

            Padding(
              padding: const EdgeInsets.only(left: 40.0,top: 10),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 30,
                      height: 20,
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: new AssetImage('assets/bedroom.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Padding(
                        padding: const EdgeInsets.all( 8.0,),
                        child: Container(

                          child: Text(
                            '${ con.myProperties!=null&&con.myProperties.length!=0?con.myProperties[con.current].nbBedrooms: ""} Bedroom ',
                            style: TextStyle(
                              color: Colors.grey.withOpacity(.6),
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                    ),

                    Container(
                      width: 30,
                      height: 20,
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: new AssetImage('assets/bathroom.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Padding(
                        padding: const EdgeInsets.all( 8.0,),
                        child: Container(

                          child: Text(
                            '${ con.myProperties!=null&&con.myProperties.length!=0?con.myProperties[con.current].nbBathrooms: ""} Bathroom ',
                            style: TextStyle(
                              color: Colors.grey.withOpacity(.6),
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                    ),


                  ],
                ),
              ),
            ),


            /// price per night

            Padding(
              padding: const EdgeInsets.only(left: 40.0,top: 10),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [


                    Padding(
                        padding: const EdgeInsets.only( left:8.0,),
                        child: Container(

                          child: Text(
                            '${(con.current+474)*4} EGP ',
                            style: TextStyle(
                              color: Colors.green ,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                    ),


                    Padding(
                        padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
                        child: Container(

                          child: Text(
                            '/ night ',
                            style: TextStyle(
                              color: Colors.grey.withOpacity(.8) ,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                    ),



                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }



}


