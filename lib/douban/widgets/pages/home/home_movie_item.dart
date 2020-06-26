import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject1app/douban/model/home_model.dart';
import 'package:flutterproject1app/douban/widgets/dashed_line.dart';
import 'package:flutterproject1app/douban/widgets/star_rating.dart';

class HYHomeMovieItem extends StatelessWidget {
  final MovieItem movie;
  HYHomeMovieItem(this.movie);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 8, color: Color(0xffcccccc)),
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(),
          SizedBox(height: 8,),
          buildContent(),
          SizedBox(height: 8,),
          buildFooter()
        ],
      ),
    );
  }
  // 头部排名
  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 238, 205, 144),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        "No.${movie.rank}",
        style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 131, 95, 36)),
      ),
    );
  }

  // 内容布局
  Widget buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildContentImage(),
        SizedBox(width: 8,),
        buildContentInfo(),
        SizedBox(width: 8,),
        buildContentLine(),
        SizedBox(width: 8,),
        buildContentWish(),
      ],
    );
  }

  // 内容的图片
  Widget buildContentImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),  // 图片裁剪
      child: Image.network(
        movie.imageURL,
        height: 150,
      )
    );
  }

  //内容的信息
  Widget buildContentInfo() {
    return Expanded(  // 加上之后可以伸缩
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildContentInfoTitle(),
          SizedBox(height: 8,),
          buildContentInfoRate(),
          SizedBox(height: 8,),
          buildContentInfoDesc()
        ],
      ),
    );
  }

  Widget buildContentInfoTitle() {
    return Text.rich(
      TextSpan(
          children: [
            WidgetSpan(
              child: Icon(
                Icons.play_circle_outline,
                color: Colors.redAccent,
                size: 24,
              )
            ),
            TextSpan(text: movie.title,style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextSpan(text: "(${movie.playDate})", style: TextStyle(fontSize: 16, color: Colors.grey),)
          ]
      )
    );
  }

  Widget buildContentInfoRate() {
    return FittedBox(
      child: Row(
        children: [
          HYStarRating(rating: movie.rating, size: 20,),
          SizedBox(width: 6,),
          Text("${movie.rating}", style: TextStyle(fontSize: 16),)
        ],
      ),
    );
  }

  Widget buildContentInfoDesc() {

    final genresString = movie.genres.join(" ");
    final directorString = movie.director.name;
    final actorString = movie.casts.map((item) => item.name).toList().join(" ");

    return Text(
      "$genresString / $directorString / $actorString",
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 16),
    );
  }

  // 内容虚线
  Widget buildContentLine() {
    return Container(
      height: 120,
      child: HYDashedLine(
        axis: Axis.vertical,
        dashedWidth: 1,
        dashedHeight: 6,
        count: 10,
        color: Colors.pink,
      ),
    );
  }

  // 内容的想看
  Widget buildContentWish() {
    return Column(
      children: [
        Image.asset("assets/images/home/wish.png"),
        Text("想看", style: TextStyle(fontSize: 16, color: Colors.pink),)
      ],
    );
  }

  // 尾部的布局
  Widget buildFooter() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xffe2e2e2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(movie.originalTitle, style: TextStyle(fontSize: 20,color: Color(0xff666666)),),
    );
  }
}