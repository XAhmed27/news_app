import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/data/model/SourcesResponseDm.dart';

class ApiManger {
  static String baseUrl = "newsapi.org";
  static String apiKey = "9aa33ec98499401a9df00c68aa114696";
  static Future<SourcesResponseDm> getSources() async {
    Uri url =
        Uri.https(baseUrl, "v2/top-headlines/sources", {"apiKey": apiKey});
    var response = await http.get(url);
    Map json = jsonDecode(response.body) as Map;
    SourcesResponseDm responseDm = SourcesResponseDm.fromJson(json);
    return responseDm;
  }
}
