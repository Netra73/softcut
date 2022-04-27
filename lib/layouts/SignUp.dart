import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:softcut/api/PostSignUp.dart';
import 'package:softcut/functions/UserData.dart';
import 'package:softcut/functions/validations.dart';
import 'package:softcut/layouts/SelectLocation.dart';
import 'package:softcut/models/UserForm.dart';

const red = Color(0xffc1103a);

class SignUp extends StatefulWidget {

  @override
  _SignUp createState() => _SignUp();

}
class _SignUp extends State<SignUp> {
  final _signUpForm  = GlobalKey<FormState>();
  UserForm userForm = UserForm();
  bool mblError= false;
  bool emailError=false;
  bool acnumError=false;
  bool autovalidate = false;
  bool isError = false;
  String errorMsg ="";


  bool isValid = false;

  _checkValidate() {
    isValid = _signUpForm.currentState!.validate();
    if (isValid) {
      _signUpForm.currentState!.save();
       _signUp();
    } else {
      setState(() {
        autovalidate = true;
      });
    }
  }
  _showLoading() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              SizedBox(
                child: CircularProgressIndicator(),
                height: 40.0,
                width: 40.0,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Container(
                height: 200,
                width: 230,
                child: Image(
                  image: AssetImage("assets/image/softcutlogo.png") ,
                ),
              ),
            ),

            Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text("CREATE ACCOUNT",style: TextStyle(fontSize:30,color: red),)
            ),
            Form(
              autovalidateMode: AutovalidateMode.disabled,
              key: _signUpForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                    child: TextFormField(
                      validator: (value){
                        if (value==null||value.isEmpty) {
                          return 'Enter your first name';
                        }
                        else{
                          return null;
                        }
                      },
                      onSaved: (value){
                        userForm.name = value;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(width: 1,color: red),
                          ),
                          hintText: "Enter Your Name",
                          hintStyle:TextStyle(color: red,fontWeight: FontWeight.w200),
                          labelText: 'NAME',
                          labelStyle: TextStyle(color: red),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:red))
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0),
                    child: TextFormField(
                      validator: (value){
                        return mobileRequired(value!, "Enter valid mobile number");
                      },
                      onSaved: (value){
                        userForm.mobile = value!;
                      },
                      onChanged:(val){
                        setState(() {
                          mblError=false;
                        });
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.red,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(width: 1,color: red),
                          ),
                          hintText: "Enter your Phone Number",
                          hintStyle:TextStyle(color: red,fontWeight: FontWeight.w200),
                          labelText: 'PHONE NUMBER',
                          labelStyle: TextStyle(color: red),

                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:red))
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0),
                    child: TextFormField(
                      validator: (value){
                        return emailRequired(value!, "Enter valid email id");
                      },
                      onSaved: (value){
                       userForm.email = value;
                      },
                      onChanged:(val){
                        setState(() {
                          emailError=false;
                        });
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.red,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(width: 1,color: red),
                          ),
                          hintText: "Enter Your Email Id ",
                          hintStyle:TextStyle(color: red,fontWeight: FontWeight.w200),
                          labelText: 'Email Id',
                          labelStyle: TextStyle(color: red),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:red))
                      ),
                      keyboardType: TextInputType.emailAddress,

                    ),
                  ),
                  //SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter Password';
                        }
                        else{
                          return null;
                        }
                      },
                      obscureText: true,
                      onSaved: (value){
                        userForm.password=value;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(width: 1,color: red),
                          ),
                          hintText: 'Enter Password',
                          hintStyle:TextStyle(color: red,fontWeight: FontWeight.w200),
                          labelText: 'PASSWORD',
                          labelStyle: TextStyle(color: red),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:red))
                      ),
                    ),
                  ),
                 /* Padding(
                    padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter Password';
                        }
                        else{
                          return null;
                        }
                      },
                      obscureText: true,
                      onSaved: (value){
                      //  userForm.password=value;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(width: 1,color: red),
                          ),
                          hintText: 'Enter Confirm Password',
                          hintStyle:TextStyle(color: red,fontWeight: FontWeight.w200),
                          labelText: 'CONFIRM PASSWORD',
                          labelStyle: TextStyle(color: red),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:red))
                      ),
                    ),
                  ),*/
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("AlREADY HAVE AN ACCOUNT ? ",style: TextStyle(fontSize: 15,color: red,),),
                      GestureDetector(
                        onTap: () {
                        /*  setState(() {
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                                LoginPage()), (Route<dynamic> route) => false);
                          });*/
                        },
                        child: Text("LOGIN",style: TextStyle(fontSize: 15,decoration:TextDecoration.underline,color: red),),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Center(
                    child: Container(
                        width: 300.0,
                        height: 50.0,
                        child: ElevatedButton(
                          child: Text('SUBMIT',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                          style: ElevatedButton.styleFrom(
                            primary: red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            _checkValidate();
                          },
                        )
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  _signUp(){
    _showLoading();
    PostSignUp(userForm).then((value){
      var response = value;
      Navigator.pop(context);
      if(response.statusCode == 200){
        setState(() {
          String id = response.data['id'];
          print(id);
          var data = response.data['data'];
          setData("USER",id ).then((value){
            setData("USER_DATA", jsonEncode(data)).then((value){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                  SelectLocation()), (Route<dynamic> route) => false);
            });
          });
        });
      }
    }).catchError((error){
      if(error is DioError){
        Navigator.pop(context);
        if(error.response?.statusCode == 400){
          setState(() {
            errorMsg = error.response!.data['message'];
            if(errorMsg== 'The given Mobile number already exists.'){
              mblError= true;
            }else{
              emailError =true;
            }
          });
        }
      }
    });
  }
}
