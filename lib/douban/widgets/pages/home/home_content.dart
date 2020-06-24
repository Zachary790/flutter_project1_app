import 'package:flutter/material.dart';
import 'package:flutterproject1app/douban/model/home_model.dart';
import 'package:flutterproject1app/service/home_request.dart';

import 'home_movie_item.dart';
class HYHomeContent extends StatefulWidget {
  @override
  _HYHomeContentState createState() => _HYHomeContentState();
}

class _HYHomeContentState extends State<HYHomeContent> {

  final List<MovieItem> movies = [];

  @override
  void initState() {
    super.initState();
    // 发送网络请求
    HomeRequest.requestMovieList(0).then((value) {
      movies.addAll(value);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (BuildContext ctx, int index) {
          return HYHomeMovieItem(movies[index]);
        },
      ),
    );
  }
}
