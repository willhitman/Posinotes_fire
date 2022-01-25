import 'dart:convert';

import 'package:http/http.dart';
import 'package:posinotes_sqlflite/model/article_model.dart';

class ApiService {
  var uri =
      "https://willhitman.herokuapp.com/articles";

  // http request function

  Future<List<Article>> getArticle() async {
    Response res = await get(Uri.parse(
        "https://willhitman.herokuapp.com/articles"));
    print(res.statusCode);
    // check for 200 response
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      // getting articles from json and putting them
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw ("Could not get Articles at the moment, lets try that again!");
    }
  }
}
