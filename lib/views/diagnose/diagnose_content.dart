import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/widgets/bubble.dart';

final indicatorProvider = StateProvider<double>((ref) {
  return 0;
});

class DiagnoseContentPage extends HookConsumerWidget {
  const DiagnoseContentPage({Key? key}) : super(key: key);

  final String title = "診断";
  final WeatherType sunny = WeatherType.sunny;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size screenSize = MediaQuery.of(context).size;
    final StateController<double> indicatorController =
        ref.read(indicatorProvider.state);
    final double indicatorValue = ref.watch(indicatorProvider);
    ref.listen(indicatorProvider, (preValue, newValue) {
      print('もとの値$preValue');
      print('新しい値$newValue');
      if (newValue == 1.0) {
        print('5です');
        // AwesomeDialog(
        //   context: context,
        //   dialogType: DialogType.INFO_REVERSED,
        //   borderSide: const BorderSide(
        //     color: Colors.green,
        //     width: 2,
        //   ),
        //   width: 280,
        //   buttonsBorderRadius: const BorderRadius.all(
        //     Radius.circular(2),
        //   ),
        //   dismissOnTouchOutside: true,
        //   dismissOnBackKeyPress: false,
        //   onDissmissCallback: (type) {
        //     ScaffoldMessenger.of(context).showSnackBar(
        //       SnackBar(
        //         content: Text('Dismissed by $type'),
        //       ),
        //     );
        //   },
        //   headerAnimationLoop: false,
        //   animType: AnimType.BOTTOMSLIDE,
        //   title: 'INFO',
        //   desc: 'This Dialog can be dismissed touching outside',
        //   showCloseIcon: true,
        //   btnCancelOnPress: () {},
        //   btnOkOnPress: () {},
        // ).show();
        // AwesomeDialog(
        //   context: context,
        //   animType: AnimType.SCALE,
        //   dialogType: DialogType.INFO,
        //   body: const Center(
        //     child: Text(
        //       'If the body is specified, then title and description will be ignored, this allows to further customize the dialogue.',
        //       style: TextStyle(fontStyle: FontStyle.italic),
        //     ),
        //   ),
        //   title: 'This is Ignored',
        //   desc: 'This is also Ignored',
        // ).show();
        AwesomeDialog(
          context: context,
          animType: AnimType.SCALE,
          headerAnimationLoop: false,
          dialogType: DialogType.SUCCES,
          showCloseIcon: true,
          // dismissOnTouchOutside: false,
          title: 'お疲れさまでした！',
          // desc:
          //     'Dialog description here..................................................',
          btnOkText: "結果画面へ",
          btnOkOnPress: () {
            debugPrint('OnClcik');
          },
          btnOkIcon: Icons.check_circle,
          onDissmissCallback: (type) {
            debugPrint('Dialog Dissmiss from callback $type');
          },
        ).show();
      }
    });
    return Scaffold(
      backgroundColor: Colors.blue,
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
        child: Stack(
          children: [
            WeatherBg(
              weatherType: sunny,
              width: screenSize.width,
              height: screenSize.height,
            ),
            Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    constraints: BoxConstraints.expand(
                      height: screenSize.height * 0.17,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    constraints:
                        BoxConstraints.expand(height: screenSize.height * 0.7),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.red,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          SizedBox(
                            width: screenSize.width * 0.6,
                            height: screenSize.height * 0.32,
                            child: Image.asset(
                              'images/cut_snow_penguin.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            width: screenSize.width * 0.9,
                            height: screenSize.height * 0.2,
                            padding: const EdgeInsets.all(16),
                            decoration: const ShapeDecoration(
                              color: Colors.white,
                              shadows: [
                                BoxShadow(
                                  color: Color(0x80000000),
                                  offset: Offset(0, 2),
                                  blurRadius: 2,
                                ),
                              ],
                              shape: BubbleBorder(),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const <Widget>[
                                Icon(
                                  Icons.live_help,
                                  color: Colors.grey,
                                ),
                                Text(
                                  '質問１',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    height: 2.0,
                                  ),
                                ),
                                Text(
                                  'スノーボードを滑りながら、回ったり、\nジャンプしたりしたいですか？',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // インジケーターを実装する
                          // valueを動的に表示させみる
                          LinearProgressIndicator(
                            backgroundColor: Colors.grey,
                            minHeight: 10,
                            value: indicatorValue,
                            valueColor:
                                const AlwaysStoppedAnimation<Color>(Colors.red),
                          ),

                          Container(
                            width: screenSize.width,
                            padding: const EdgeInsets.symmetric(
                              // vertical: 10,
                              horizontal: 10,
                            ),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    SizedBox(
                                      width: screenSize.width * 0.46,
                                      height: screenSize.height * 0.05,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // print(5);
                                          print('はい');
                                          var progressValue =
                                              indicatorValue + 0.1;

                                          progressValue = (progressValue * 10)
                                                  .roundToDouble() /
                                              10;
                                          indicatorController
                                              .update((state) => progressValue);
                                          print(indicatorController.state);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.yellow[700],
                                          onPrimary: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                        child: const Text(
                                          'はい',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenSize.width * 0.46,
                                      height: screenSize.height * 0.05,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          print(1);
                                          print('いいえ');
                                          var progressValue =
                                              indicatorValue - 0.1;

                                          progressValue = (progressValue * 10)
                                                  .roundToDouble() /
                                              10;
                                          indicatorController
                                              .update((state) => progressValue);
                                          print(indicatorController.state);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.yellow[700],
                                          onPrimary: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                        child: const Text(
                                          'いいえ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Gap.expand(10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    SizedBox(
                                      width: screenSize.width * 0.25,
                                      height: screenSize.height * 0.05,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          print(4);
                                          print('たぶんそう');
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.yellow[700],
                                          onPrimary: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                        child: const Text(
                                          'だぶんそう',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenSize.width * 0.25,
                                      height: screenSize.height * 0.05,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          print(3);
                                          print('わからない');
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.yellow[700],
                                          onPrimary: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                        child: const Text(
                                          'わからない',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: screenSize.width * 0.25,
                                      height: screenSize.height * 0.05,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          print(2);
                                          print('たぶん違う');
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.yellow[700],
                                          onPrimary: Colors.black,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                        child: const Text(
                                          'たぶん違う',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
