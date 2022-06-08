import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/widgets/bubble.dart';

class DiagnoseTopPage extends HookConsumerWidget {
  const DiagnoseTopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final Size screenSize = MediaQuery.of(context).size;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          const Spacer(
            flex: 3,
          ),
          Column(
            children: [
              SizedBox(
                width: screenSize.width * 0.6,
                height: screenSize.height * 0.32,
                child: Image.asset(
                  'images/cut_snow_penguin.png',
                  fit: BoxFit.cover,
                ),
              ),
              const Gap(10),
              Container(
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      '自分の思うスノーボードを',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'イメージしてね!!',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            width: screenSize.width * 0.65,
            height: screenSize.height * 0.065,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/diagnoseContent');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow[700],
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text(
                '診断する',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
