/* 
@Authour: Islomkuja Akhrorov
Created at: 7/13/20
*/
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:uzmobile/model/all.dart';

class Api {
  static final Api _api = Api._();

  Api._();

  factory Api() => _api;
  final String _kUrl = "http://ussdumed.yangibozor.uz/api/index.php";

  Future<All> getAllData() async {
    final response = await http.get(_kUrl);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var json = jsonDecode(response.body);
      return All.fromJson(json);
    } else {
      throw HttpException(
          "getAllData: response status code ${response.statusCode}\nresponse body ${response.body} ");
    }
  }

  Future<String> getNews(String localization) async {
    final String _kNews = "https://mobi.uz/$localization/news/rss/";

    final response = await http.get(_kNews);
    print(response.statusCode);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return response.body;
    } else {
      throw Exception(
          "getNews: response status code ${response.statusCode}\nresponse body ${response.body} ");
    }
  }
}
