import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

List<ListTile> rideTypeTitles(
    double opacity, String rideTypeName, double size, TextTheme textTheme) {
  return [
    ListTile(
      title: Row(
        children: [
          Text('あなたのライドスタイルは', style: textTheme.headline6),
          AnimatedTextKit(
            animatedTexts: pointAnimatedText(textTheme.headline6!),
            totalRepeatCount: 1,
            pause: const Duration(seconds: 1),
            isRepeatingAnimation: false,
            onFinished: () {},
          ),
        ],
      ),
    ),
    ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            opacity: opacity,
            duration: const Duration(
              seconds: 1,
            ),
            child: AnimatedDefaultTextStyle(
              child: Text(rideTypeName),
              style: textTheme.headline3!,
              duration: const Duration(
                seconds: 1,
              ),
              onEnd: () {},
            ),
          ),
        ],
      ),
    ),
    ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'タイプです！！',
            style: textTheme.headline6!,
          ),
        ],
      ),
    ),
  ];
}

List<AnimatedText> pointAnimatedText(TextStyle textStyle) {
  List<AnimatedText> widgetList = [];

  for (int i = 0; i < 3; i++) {
    widgetList.add(TyperAnimatedText(
      '...',
      textStyle: textStyle,
      speed: const Duration(
        milliseconds: 1000,
      ),
    ));
  }
  return widgetList;
}
