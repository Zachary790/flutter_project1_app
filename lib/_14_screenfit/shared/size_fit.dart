import 'dart:ui';
class HYSizeFit {

  static double physicalWidth;
  static double physicalHeight;
  static double screenWidth;
  static double screenHeight;
  static double dpr;
  static double statusHeight;
  static double rpx;
  static double px;

  static void initialize({double standardSize = 750}) {
    // 1.手机的物理分辨率
    physicalWidth = window.physicalSize.width;
    physicalHeight = window.physicalSize.height;
    print('分辨率：$physicalWidth * $physicalHeight');

    // 2.获取dpr
    dpr = window.devicePixelRatio;

    // 宽度和高度
    screenWidth = physicalWidth / dpr;
    screenHeight = physicalHeight / dpr;
    print('宽高：$screenWidth * $screenHeight');
    statusHeight = window.padding.top / dpr;
    print('状态栏的高度：$statusHeight');

    rpx = screenWidth / standardSize;
    px = screenWidth / standardSize * 2;
  }

  static double setRpx(double size) {
    return rpx * size;
  }
  static double setPx(double size) {
    return px * size;
  }
}