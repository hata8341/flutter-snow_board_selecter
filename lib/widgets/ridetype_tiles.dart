import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

List<ListTile> rideTypeTitles(
    double opacity, String rideTypeName, double size) {
  return [
    ListTile(
      title: Row(
        children: [
          const Text('あなたのライドスタイルは'),
          AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText(
                '...',
                speed: const Duration(
                  milliseconds: 1000,
                ),
              ),
              TyperAnimatedText(
                '...',
                speed: const Duration(
                  milliseconds: 1000,
                ),
              ),
              TyperAnimatedText(
                '...',
                speed: const Duration(
                  milliseconds: 1000,
                ),
              ),
              TyperAnimatedText(
                '...',
                speed: const Duration(
                  milliseconds: 1000,
                ),
              ),
            ],
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
              style: TextStyle(
                fontSize: size,
                color: Colors.black,
              ),
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
        children: const [
          Text('タイプです！！'),
        ],
      ),
    ),
  ];
}
