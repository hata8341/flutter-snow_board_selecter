import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/view_model/theme_view_mode.dart';
import 'package:sbselector/widgets/bubble.dart';

class DiagnoseTopPage extends ConsumerWidget {
  const DiagnoseTopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size screenSize = MediaQuery.of(context).size;

    final themeStateController = ref.watch(themeStateProvider.notifier);

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
                width: screenSize.width * 0.65,
                height: screenSize.height * 0.32,
                child: Image.asset(
                  'images/snow_penguin_top.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
              const Gap(10),
              Container(
                height: screenSize.height * 0.2,
                padding: const EdgeInsets.all(16),
                decoration: ShapeDecoration(
                  color: themeStateController.getBubbleColor(),
                  shadows: const [
                    BoxShadow(
                      offset: Offset(0, 2),
                      blurRadius: 2,
                    ),
                  ],
                  shape: const BubbleBorder(),
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
                primary: themeStateController.getBarColor(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Text(
                '診断する',
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      fontWeight: FontWeight.normal,
                      color: Colors.grey.shade900,
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
