import 'package:flutter/material.dart';

class BubbleBorder extends ShapeBorder {
  final bool usePadding;

  const BubbleBorder({this.usePadding = true});

  @override
  EdgeInsetsGeometry get dimensions =>
      EdgeInsets.only(bottom: usePadding ? 12 : 0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    // throw UnimplementedError();
    assert(textDirection != null,
        'The textDirection argument to $runtimeType.getInnerPath must not be null.');
    return Path();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final r =
        Rect.fromPoints(rect.topLeft, rect.bottomRight - const Offset(0, 12));
    return Path()
      ..addRRect(RRect.fromRectAndRadius(r, const Radius.circular(8)))
      ..moveTo(r.topCenter.dx - 10, r.topCenter.dy)
      ..relativeLineTo(10, -12)
      ..relativeLineTo(10, 12)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return this;
  }
}
