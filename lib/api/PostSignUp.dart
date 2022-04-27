import 'dart:async';
import 'package:dio/dio.dart';
import 'package:softcut/functions/Config.dart';
import 'package:softcut/models/UserForm.dart';

Future<Response> PostSignUp(UserForm userForm) async {
  var body =
  {
    'name' : userForm.name,
    'mobile':userForm.mobile,
    'email':userForm.email,
    'password':userForm.password,

  };

  final response = await   Dio().postUri(Uri.parse(API_URL+'user'),
      data: body,
      options: Options(headers:{'x-api-key':'GRACE@123','Authorization':'Basic YWRtaW46MTIzNA==','Content-type': 'application/json'})
  );
  return response;
}