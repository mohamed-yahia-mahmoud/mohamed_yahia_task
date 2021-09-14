import 'package:flutter/material.dart';
class MyPropertyItem extends StatelessWidget {


  final String img;
  final VoidCallback onPressed;



  const MyPropertyItem({
    Key key,

    this.img ,
    this.onPressed,
   }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return    Container(
      height: 800,
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: InkWell(
            onTap: onPressed,
            child: Stack(
              children: <Widget>[
                Image.network(img, fit: BoxFit.cover, width: 1000.0),
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
            ),
          )
      ),
    );
  }
}

