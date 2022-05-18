import 'dart:async';

import 'package:dio/dio.dart';
import 'package:softcut/functions/Config.dart';
import 'package:softcut/models/SubCategory.dart';

Future<List<SCategory>> getSubCategory(String id) async {
  String username = 'admin';
  String password = '1234';

  final response = await Dio().getUri(Uri.parse(API_URL +'sub_category/'+id),
      options: Options(headers: {
        'x-api-key': 'GRACE@123',
        'Authorization': 'Basic YWRtaW46MTIzNA==',
        'Content-type': 'application/json'
      }));
  List<SCategory> scList = [];
  if (response.statusCode == 200) {
    var data = response.data['data'];
    for (var details in data) {
      String id = details['id'];
      String title = details['category_name'];
      String icon = details['icon'];
      scList.add(SCategory(id,title,icon));
    }
  }
  return scList;
}
