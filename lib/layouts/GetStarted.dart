import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:softcut/layouts/LoginPage.dart';

const red = Color(0xffc1103a);

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);


  @override
  _GetStarted createState() => _GetStarted();

}
class _GetStarted extends State<GetStarted> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/image/softcutimage.jpg"),
                  fit: BoxFit.cover
              ) ,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 350),
            child: Center(
              child: Container(
                  width: 250.0,
                  height: 50.0,
                  child: ElevatedButton(
                    child: Text('START',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      primary: red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                     Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>  LoginPage(),
                      ));
                    },
                  )
              ),
            ),
          ),
        ],
      ),

    );
  }

}
