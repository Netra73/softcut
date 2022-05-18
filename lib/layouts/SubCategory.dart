import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:softcut/api/getSubCategory.dart';
import 'package:softcut/layouts/LoginPage.dart';
import 'package:softcut/models/SubCategory.dart';

const red = Color(0xffc1103a);

class SubCategory extends StatefulWidget {
  final String  id;
  const SubCategory({Key? key, required this.id,});

  @override
  _SubCategory createState() => _SubCategory(id);

}

class _SubCategory extends State<SubCategory> {
  List<SCategory>scList = [];

  String id;
  _SubCategory(this.id);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:/* Container(
        padding: EdgeInsets.all(10.0),
        child: cList.length == 0 ? FutureBuilder<List<SCategory>>(
          future: getSubCategory(id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SpinKitCircle(
                color: red,
                size: 50,
              );
            }
            if (snapshot.hasData) {
              cList = snapshot.data!;
              return ScategoryList();
            }
            return Container(
              child: Text('No SubCategory',style: TextStyle(fontSize: 20),),
            );
          },
        ) : ScategoryList(),
      ),*/


      Container(
        // padding: EdgeInsets.all(10.0),
        height: 150,
        child: scList.length == 0 ? FutureBuilder<List<SCategory>>(
          future: getSubCategory(id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SpinKitCircle(
                color: red,
                size: 50,
              );
            }
            if (snapshot.hasData) {
              scList = snapshot.data!;
              return ScategoryList();
            }
            return Container(
              child: Text('No Subcategory',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            );
          },
        ) : ScategoryList(),

      ),
    /*Center(
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
      ),*/
    );
  }
  GridView ScategoryList() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: scList.length,
      physics: ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (cc, i)  {
        return  Stack(
          children: [
            FutureBuilder(
                future:getSubCategory(id),
                builder: (cc,snap){
                  print(snap.data.toString());
                  if(snap.hasData){
                    return  Container(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
                      margin: EdgeInsets.all(8.0),
                      width: 70.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          // image:AssetImage("assets/image/chicken.jpg"),
                          image:NetworkImage(scList[i].icon),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(200.0)),
                        color: Colors.redAccent,
                      ),
                    );
                  }
                  return SizedBox();
                }),
          ],
        );
         /* Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
          margin: EdgeInsets.all(8.0),
          width: 70.0,
          height: 100.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
             // image:AssetImage("assets/image/chicken.jpg"),
              image:NetworkImage(scList[i].icon),
            ),
            borderRadius: BorderRadius.all(Radius.circular(200.0)),
            color: Colors.redAccent,
          ),
        );*/
      },
    );
  }
}

