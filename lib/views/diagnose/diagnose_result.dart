import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// const gridColor = Color(0xff68739f);
// const titleColor = Color(0xff8c95db);
// const fashionColor = Color(0xffe15665);
// const artColor = Color(0xff63e7e5);
// const boxingColor = Color(0xff83dea7);
// const entertainmentColor = Colors.white70;
// const offRoadColor = Color(0xFFFFF59D);


class DiagnoseResultPage extends HookConsumerWidget {
  DiagnoseResultPage({Key? key}) : super(key: key);

  String title = "診断結果";
  final WeatherType sunny = WeatherType.sunny;
  bool cute = false;
  bool beautiful = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: screenSize.width * 0.26,
        title: Row(
          children: <Widget>[
            const Icon(Icons.search),
            Text(title),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            // スタンス・ライドスタイル
            Material(
              elevation: 1.0,
              shadowColor: Colors.blueGrey,
              child: ListTile(
                tileColor: Colors.grey[100],
                title: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'スタンス・ライドスタイル',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            ExpansionTile(
              title: Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('推奨スタンス'),
                      Chip(
                        backgroundColor: Colors.blue[50],
                        label: const Text(
                          'レギュラー・ダック',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onExpansionChanged: (bool changed) {
                // setState(() {
                //   cute = false;
                //   beautiful = changed;
              },
              children: <Widget>[
                CheckboxListTile(
                  value: cute,
                  onChanged: (checked) {
                    // setState(() {
                    //   cute = checked!;
                    // });
                  },
                  title: const Text('可愛い系'),
                ),
                CheckboxListTile(
                  value: beautiful,
                  onChanged: (checked) {
                    // setState(() {
                    //   beautiful = checked!;
                    // });
                  },
                  title: const Text('美人系'),
                ),
              ],
            ),
            ExpansionTile(
              title: Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('推奨ライド'),
                      Chip(
                        backgroundColor: Colors.blue[50],
                        label: const Text(
                          'フリーラン',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onExpansionChanged: (bool changed) {
                // setState(() {
                //   cute = false;
                //   beautiful = changed;
              },
              children: const <Widget>[
                SizedBox(
                  height: 50,
                  child: Text('あなたはフリーランでライドスタイルを楽しむ傾向があります'),
                ),
              ],
            ),
            Material(
              elevation: 1.0,
              shadowColor: Colors.blueGrey,
              child: ListTile(
                tileColor: Colors.grey[100],
                title: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'スノーボード',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.green,
                    width: 2,
                  ),
                ),
                child: const Center(
                  child: Text('レーダーチャート'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
