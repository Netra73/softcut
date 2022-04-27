import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:softcut/layouts/HomePage.dart';
import 'package:softcut/layouts/LoginPage.dart';

const red = Color(0xffc1103a);

class SelectLocation extends StatefulWidget {
  const SelectLocation({Key? key}) : super(key: key);


  @override
  _SelectLocation createState() => _SelectLocation();

}
class _SelectLocation extends State<SelectLocation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 250),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Center(
                  child: Text("CHOOSE CITY",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:red),),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      height: 100,
                      // width: 80,
                      image: AssetImage("assets/image/hubli.png") ,
                    ),
                    SizedBox(width: 10,),
                    ElevatedButton(
                      child: Text('HUBLI',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        primary: red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>  HomePage(),
                        ));
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      height: 100,
                      // width: 80,
                      image: AssetImage("assets/image/hubli.png") ,
                    ),
                    SizedBox(width: 10,),
                    ElevatedButton(
                      child: Text('DHARWAD',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        primary: red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>  HomePage(),
                        ));
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      height: 100,
                      // width: 80,
                      image: AssetImage("assets/image/hubli.png") ,
                    ),
                    SizedBox(width: 10,),
                    ElevatedButton(
                      child: Text('BELGAUM',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        primary: red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>  HomePage(),
                        ));
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      height: 100,
                      // width: 80,
                      image: AssetImage("assets/image/hubli.png") ,
                    ),
                    SizedBox(width: 10,),
                    ElevatedButton(
                      child: Text('GADAG',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        primary: red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>  HomePage(),
                        ));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }

}
