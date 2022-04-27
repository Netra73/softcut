import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:softcut/functions/Config.dart';

Future<Response> getUser(String id) async {
  String username = 'admin';
  String password = '1234';

  final response = await   Dio().getUri(Uri.parse(API_URL+'user_details/'+id),
      options:Options(headers:{'x-api-key':'GRACE@123','Authorization':'Basic YWRtaW46MTIzNA==','Content-type': 'application/json'}));
  print(response.data);
  return response;

}


