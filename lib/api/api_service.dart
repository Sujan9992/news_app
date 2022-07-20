import 'package:flutter_news_app/model/model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<News> getNews() async {
    const String url =
        'https://newsapi.org/v2/everything?q=bitcoin&apiKey=d394960d6d364a9eacb07e25ed5d5e76';
    var res = await http.get(
      Uri.parse(url),
    );
    if (res.statusCode == 200) {
      return newsFromJson(res.body);
    } else {
      throw ('Unable to fetch data ${res.statusCode}.');
    }
  }
}
