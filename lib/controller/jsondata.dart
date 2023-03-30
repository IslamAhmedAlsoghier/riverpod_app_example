import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpods_app_example/models/apiModel.dart';

final getFutureJsonData =
    ChangeNotifierProvider<GetDataFromApi>((ref) => GetDataFromApi());

class GetDataFromApi extends ChangeNotifier {
  List<ApiModel> listApiModel = [];

  GetDataFromApi() {
    getJsonData();
  }

  Future getJsonData() async {
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
      http.Response respose = await http.get(url);
      var data = json.decode(respose.body);

      for (int i = 0; i < data.length; i++) {
        listApiModel.add(ApiModel.fromMap(data[i]));
      }
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }
}
