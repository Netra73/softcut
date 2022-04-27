import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:softcut/api/PostLogin.dart';
import 'package:softcut/functions/UserData.dart';
import 'package:softcut/functions/validations.dart';
import 'package:softcut/layouts/HomePage.dart';
import 'package:softcut/layouts/SelectLocation.dart';
import 'package:softcut/layouts/SignUp.dart';
import 'package:softcut/models/LoginForm.dart';

const red = Color(0xffc1103a);

class LoginPage extends StatefulWidget {

  @override
  _Login createState() => _Login();

}
class _Login extends State<LoginPage> {
  final _loginForm  = GlobalKey<FormState>();
  LoginForm loginForm = LoginForm();

  bool wrngemailError = false;
  bool wrngpaswdError = false;
  String errorMsg ="";
  bool autovalidate = false;
  bool isValid = false;

  _checkValidate() {
    isValid = _loginForm.currentState!.validate();
    if (isValid) {
      _loginForm.currentState!.save();
      _login();
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
        return Container(
          child: Center(
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
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return
     Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 70.0),
                child: Container(
                  height: 200,
                  width: 230,
                  child: Image(
                    image: AssetImage("assets/image/softcutlogo.png") ,
                  ),
                ),
              ),

              Form(
                autovalidateMode: AutovalidateMode.disabled,
                key: _loginForm,
                child: Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0),
                        child: TextFormField(
                          validator: (value){
                            return emailRequired(value!, "Enter valid email id");
                          },
                          onSaved: (value){
                            loginForm.email = value!;
                          },
                          decoration:  InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(width: 1,color: red),
                              ),
                              hintText: "Enter Your Email Id",
                              hintStyle:TextStyle(color: red,fontWeight: FontWeight.w200),
                              labelText: 'Email',
                              labelStyle: TextStyle(color: red),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:red))
                          ),
                          onChanged:(val){
                            setState(() {
                              wrngemailError=false;
                            });
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      if(wrngemailError)
                        Padding(
                          padding: EdgeInsets.only(right:220.0),
                          child:Text(errorMsg,style: TextStyle(fontSize:16,color: Colors.red),),
                        ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.0,left: 20.0,right: 20.0),
                        child: TextFormField(
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Password';
                            }
                            else{
                              return null;
                            }
                          },
                          onSaved: (value){
                            loginForm.password = value!;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(width: 1,color: red),
                              ),
                              hintText: "Enter Your Password",
                              hintStyle:TextStyle(color: red,fontWeight: FontWeight.w200),
                              labelText: 'Password',
                              labelStyle: TextStyle(color: red),
                              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:red))
                          ),
                          onChanged:(val){
                            setState(() {
                              wrngpaswdError=false;
                            });
                          },
                        ),
                      ),
                      if(wrngpaswdError)
                        Padding(
                          padding: EdgeInsets.only(right:220.0),
                          child:Text(errorMsg,style: TextStyle(fontSize:16,color: Colors.red),),
                        ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(left: 200.0),
                        child: GestureDetector(
                          onTap: () {
                           /* Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>  ForgotPassword(),
                            ));*/
                          },
                          child: Text('Forgot password?',style: TextStyle(fontSize: 18,color: red),
                          ),
                        ),
                      ),

                      SizedBox(height: 40,),
                      Container(
                          width: 300.0,
                          height: 50.0,
                          child: ElevatedButton(
                            child: Text('Login',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
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
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('DONT HAVE AN ACCOUNT? ',style: TextStyle(fontSize:15,color: red),),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) =>  SignUp(),
                              ));
                            },
                            child: Text('SIGN UP',style: TextStyle(fontSize: 15,decoration: TextDecoration.underline,color: red
                            ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),
                    /*  GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>  HomePage(),
                          ));
                        },
                          child: Text('HomePage',style: TextStyle(fontSize:18,color: red),)
                      ),
                      SizedBox(height: 10,),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>  SelectLocation(),
                          ));
                        },
                          child: Text('Select Location',style: TextStyle(fontSize:18,color: red),)
                      ),*/
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
 _login() {
    _showLoading();
    PostLogin(loginForm).then((value){
      var response = value;
      Navigator.pop(context);
      if(response.statusCode == 200){
        setState(() {
          var data = response.data['data'];
          String id = data['id'];
          setData("USER",id ).then((value){
            setData("USER_DATA", jsonEncode(data)).then((value){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                  HomePage()), (Route<dynamic> route) => false);
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
            print(errorMsg);
            if(errorMsg=='Wrong email.'){
              wrngemailError= true;
            }else{
              wrngpaswdError =true;
            }
          });
        }
      }
    });
  }
}

