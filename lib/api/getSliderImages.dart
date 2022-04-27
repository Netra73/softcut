import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:softcut/functions/Config.dart';

Future<List> getSliderImage() async {
  String username = 'admin';
  String password = '1234';

  final response = await Dio().getUri(Uri.parse(API_URL + 'slider_1'),
      options: Options(headers: {
        'x-api-key': 'GRACE@123',
        'Authorization': 'Basic YWRtaW46MTIzNA==',
        'Content-type': 'application/json'
      }));
  print(response.data);

  List<String> sList = [];
  if (response.statusCode == 200) {
    var data = response.data['data'];
    for (var details in data) {
      String id = details['id'];
      String slider_name = details['slider_name'];
      String image = details['image'];
      sList.add(image);
    }
  }
  return sList;
}
