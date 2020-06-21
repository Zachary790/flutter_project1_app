import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HYStarRating extends StatefulWidget {
  final double rating;  // 分数
  final double maxRating; // 满分
  final int count;  // 展示几颗星
  final double size;  // 大小
  final Color unselectedColor;
  final Color selectedColor;
  final Widget unselectedImage;
  final Widget selectedImage;

  HYStarRating({
    @required this.rating,
    this.maxRating = 10,
    this.count = 5,
    this.size = 30,
    this.unselectedColor = const Color(0xffbbbbbb),
    this.selectedColor = const Color(0xffff0000),
    Widget unselectedImage,
    Widget selectedImage,
  }): unselectedImage = unselectedImage ?? Icon(Icons.star_border, color: unselectedColor, size: size),
        selectedImage = selectedImage ?? Icon(Icons.star, color: selectedColor, size: size,);
  @override
  _HYStarRatingState createState() => _HYStarRatingState();
}

class _HYStarRatingState extends State<HYStarRating> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(mainAxisSize: MainAxisSize.min, children: buildUnselectedStar()),
        Row(mainAxisSize: MainAxisSize.min, children:buildSelectedStar())
      ],
    );
  }

  List<Widget> buildUnselectedStar(){
    return List.generate(widget.count, (index) {
      return widget.unselectedImage;
    });
  }

  List<Widget> buildSelectedStar(){
    // 1.创建stars
    List<Widget> stars = [];
    final star = widget.selectedImage;
    // 2.构建满填充的stars
    double oneValue = widget.maxRating / widget.count;
    int entireCount = (widget.rating / oneValue).floor();
    for(var i = 0; i < entireCount; i++) {
      stars.add(star);
    }
    // 3.构建部分填充star
    double leftWidth = ((widget.rating / oneValue) - entireCount) * widget.size;
    stars.add(ClipRect(
      clipper: HYStarClipper(width: leftWidth),  // 如何裁剪
      child: star,
    ));
    if(stars.length > widget.count) {
      return stars.sublist(0, widget.count);
    }
    return stars;
  }
}

class HYStarClipper extends CustomClipper<Rect> {
  double width;
  HYStarClipper({this.width});
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  // 重新裁剪
  @override
  bool shouldReclip(HYStarClipper oldClipper) {
    // TODO: implement shouldReclip
    return oldClipper.width != this.width;
  }

}