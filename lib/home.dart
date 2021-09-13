import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mohamed_yahia_task/mobx/HomeMobx.dart';
import 'package:provider/provider.dart';

 final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class Home extends StatefulWidget {

     List items=['https://picsum.photos/200','https://picsum.photos/200','https://picsum.photos/200','https://picsum.photos/200','https://picsum.photos/200','https://picsum.photos/200','https://picsum.photos/200',];
    Home({  key,items}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  int _current = 0;

  int index=0;

  HomeMobx con;


  Widget build(BuildContext context) {

    con=Provider.of<HomeMobx>(context);

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
            Stack(
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
                      children: imgList.map((url) {
                         index = imgList.indexOf(url);
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

            /// the name of each flat under the card
            Padding(
                padding: const EdgeInsets.only(left: 44.0,top: 8),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Italian style JMVB # ${con.current+1}',
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
                            '${(con.current+1)*2} Bedroom ',
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
                            '${(con.current+1)+1} Bathroom ',
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


            /// num of each bedroom and bathroom in any flat

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

final List<Widget> imageSliders =  imgList.map((item) => Container(
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
