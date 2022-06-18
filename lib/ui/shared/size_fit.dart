// ignore_for_file: prefer_final_fields

import 'dart:ui';

class SizeFit {
  static double physicalWidth = 0;
  static double physicalHieght = 0;
  static double dpr = 0;
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double statusHeight = 0;
  static double safeBottomHeight = 0;

  static double rpx = 0;
  static double px = 0;

  static double _standardSize = 0;

  static void initialze({double standardSize = 750}) {
    // 1. 手机的物理分辨率
    physicalWidth = window.physicalSize.width;
    physicalHieght = window.physicalGeometry.height;

    // 2. 获取 dpr
    dpr = window.devicePixelRatio;

    // 3. 获取渲染宽度和高度
    screenWidth = physicalWidth / dpr;
    screenHeight = physicalHieght / dpr;

    // 4. 获取状态栏
    statusHeight = window.padding.top / dpr;

    // 5. 获取底部安全区高度
    safeBottomHeight = window.padding.bottom / dpr;

    // 6.
    rpx = screenWidth / standardSize;
    px = screenWidth / standardSize * dpr;
  }

  static double setRpx(double size) {
    if (size == _standardSize) {
      return screenWidth;
    }

    return rpx * size;
  }

  static double setPx(double size) {
    if (size == _standardSize * dpr) {
      return screenWidth;
    }

    return px * size;
  }
}
