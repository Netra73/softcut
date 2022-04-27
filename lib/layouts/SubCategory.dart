import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:softcut/layouts/LoginPage.dart';

const red = Color(0xffc1103a);

class SubCategory extends StatefulWidget {
  const SubCategory({Key? key}) : super(key: key);


  @override
  _SubCategory createState() => _SubCategory();

}
class _SubCategory extends State<SubCategory> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: 6,
          physics: ScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
              margin: EdgeInsets.all(8.0),
              width: 70.0,
              height: 100.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image:AssetImage("assets/image/chicken.jpg"),
                ),
                borderRadius: BorderRadius.all(Radius.circular(200.0)),
                color: Colors.redAccent,
              ),
            );
          },
        ),
      ),
    );
  }

}
