import 'package:flutter_navigator/model/home_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const HOME_URL = 'http://www.devio.org/io/flutter_app/json/home_page.json';

class HomeDao {
  static Future<HomeModel> fetch() async {
    final response = await http.get(Uri.parse(HOME_URL));
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = const Utf8Decoder();
      return HomeModel.fromJson(
          json.decode(utf8decoder.convert(response.bodyBytes)));
    } else {
      throw Exception('home_page.json 请求失败');
    }
  }
}
