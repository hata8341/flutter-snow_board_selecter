import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

List<ListTile> rideTypeTitles(String rideTypeName, TextTheme textTheme) {
  const double opacity = 1.0;

  return [
    ListTile(
      title: Row(
        children: [
          Text('あなたのライドタイプは', style: textTheme.subtitle1),
          AnimatedTextKit(
            animatedTexts: pointAnimatedText(textTheme.headline6 as TextStyle),
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
              style: textTheme.headline4 as TextStyle,
              duration: const Duration(
                seconds: 1,
              ),
              onEnd: () {},
              child: Text(rideTypeName),
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
            style: textTheme.subtitle1 as TextStyle,
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
