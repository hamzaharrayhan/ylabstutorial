import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ylabstutorial/models/newsmodel.dart';
import 'package:ylabstutorial/models/storemodel.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<StoreProduct>> fetchStoreProducts() async {
    var url = Uri.parse(
        "http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline");
    var response = await client.get(url);
    if (response.statusCode == 200) {
      var jsonMap = storeProductFromJson(response.body);
      return jsonMap;
    } else {
      return null;
    }
  }

  static Future<News> fetchNews() async {
    var newsModel;

    try {
      var url = Uri.parse(
          "http://newsapi.org/v2/everything?domains=wsj.com&apiKey=d91b9f29140643a6aede0214fd5f8e1d");
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var jsonMap = json.decode(response.body);
        newsModel = News.fromJson(jsonMap);
      }
    } catch (e) {
      return newsModel;
    }

    return newsModel;
  }
}
