import 'dart:ui';

extension RelativeDimentions on num {
  static late double designWidth;
  double get _width => window.physicalSize.width / window.devicePixelRatio;
  double get relative => _width * this.toDouble() / designWidth;
}
