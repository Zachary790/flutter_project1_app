import 'package:flutterproject1app/douban/model/home_model.dart';
import 'package:flutterproject1app/service/config.dart';
import 'package:flutterproject1app/service/http_request.dart';

class HomeRequest {
  static Future<List<MovieItem>> requestMovieList(int start) async {
    // 构建url
    final moveURL = "/movie/top250?start=$start&count=${HomeConfig.movieCount}";
    // 发送网络请求
    final result = await HttpRequest.request(moveURL);
    final subjects = result['subjects'];
    // 将map数据转成模型
    List<MovieItem> movies = [];
    for (var sub in subjects){
      movies.add(MovieItem.fromMap(sub));
    }

    return movies;
  }
}