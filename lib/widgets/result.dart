import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/const/rideType.dart';
import 'package:sbselector/model/my_ridetype.dart';
import 'package:sbselector/view_model/page_view_model.dart';
import 'package:sbselector/widgets/board_tile.dart';
import 'package:sbselector/widgets/delete_dialog.dart';
import 'package:sbselector/widgets/end_dialog.dart';
import 'package:sbselector/widgets/ridetype_tiles.dart';
import 'package:sbselector/widgets/save_button.dart';
import 'package:sbselector/widgets/share_button.dart';
import 'package:screenshot/screenshot.dart';

// resultDetailのパラメタの修正
class ResultDetail extends HookConsumerWidget {
  ResultDetail(Key? key, this.rideType, [this.myRideType]) : super(key: key);
  final RideType rideType;
  final MyRideType? myRideType;

  final String title = "診断結果";

  final double size = 50;
  final double opacity = 1.0;

  // ListViewのスクロールの位置を取得するためのcontorller
  final ScrollController _scrollController = ScrollController();

  final ScreenshotController _screenShotController = ScreenshotController();

  bool checkRoute(String routeName) {
    if (routeName == '/historyDetail') {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String routeName = ModalRoute.of(context)!.settings.name as String;
    final bool currRouteState = checkRoute(routeName);
    final Size screenSize = MediaQuery.of(context).size;
    final PageNotifier pageController = ref.watch(pageProvider.notifier);
    final String rideTypeName = pageController.checkWriteInRideType(rideType);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.popUntil(
              context,
              ModalRoute.withName('/diagnoseTop'),
            );
          },
        ),
        titleSpacing: screenSize.width * 0.24,
        title: Row(
          children: <Widget>[
            const Icon(Icons.search),
            Text(title),
          ],
        ),
        actions: [
          Visibility(
            visible: currRouteState,
            child: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                showSelfDialog(deleteDialog(context, ref, myRideType!.id));
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Screenshot(
          controller: _screenShotController,
          child: ListView(
            controller: _scrollController,
            children: <Widget>[
              const Gap(20),
              for (ListTile tile in rideTypeTitles(opacity, rideTypeName, size))
                tile,
              const Gap(20),
              ListTile(
                title: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.blue,
                        width: 5.0,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.snowboarding),
                      Text(
                        'スノーボード',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(20),
              boardTile(_scrollController, rideType.firstRecommendBoard, 1),
              boardTile(_scrollController, rideType.secondRecommendBoard, 2),
              const Gap(20),
              Container(
                padding: const EdgeInsets.fromLTRB(30, 0, 20, 0),
                child: Text(
                  rideType.discription,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: !currRouteState
                    ? MainAxisAlignment.spaceEvenly
                    : MainAxisAlignment.center,
                children: [
                  shareButton(_screenShotController),
                  Visibility(
                    visible: !currRouteState,
                    child: saveButton(rideType, context, ref),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
