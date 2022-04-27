import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:softcut/functions/Config.dart';
import 'package:softcut/models/LoginForm.dart';

Future<Response> PostLogin(LoginForm loginForm) async {
  var body =
  {
    'email': loginForm.email,
    'password': loginForm.password
  };

  final response = await   Dio().postUri(Uri.parse(API_URL+'user_signin'),
      data: body,
      options: Options(headers:{'x-api-key':'GRACE@123','Authorization':'Basic YWRtaW46MTIzNA==','Content-type': 'application/json'}));
  return response;
}