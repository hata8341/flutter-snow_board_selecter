import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/const/ridetype.dart';
import 'package:sbselector/view_model/history.dart';
import 'package:sbselector/view_model/page_view_model.dart';
import 'package:sbselector/widgets/board_tile.dart';
import 'package:sbselector/widgets/delete_dialog.dart';
import 'package:sbselector/widgets/end_dialog.dart';
import 'package:sbselector/widgets/ridetype_tiles.dart';
import 'package:sbselector/widgets/share_button.dart';
import 'package:screenshot/screenshot.dart';

class ResultDetail extends HookConsumerWidget {
  ResultDetail({Key? key, required this.rideType, required this.id})
      : super(key: key);
  final RideType rideType;
  final String? id;

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
    final PageStateNotifier pageController =
        ref.watch(pageStateProvider.notifier);
    final String rideTypeName = pageController.checkWriteInRideType(rideType);

    final textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        leading: Consumer(
          builder: (context, ref, _) {
            final histroyController =
                ref.watch(historyNotifierProvider.notifier);
            return IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                if (!currRouteState) {
                  histroyController.add(rideType);
                }
                Navigator.popUntil(
                  context,
                  ModalRoute.withName('/'),
                );
              },
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
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                showSelfDialog(
                  deleteDialog(context, ref, id!),
                );
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          controller: _scrollController,
          children: <Widget>[
            Screenshot(
              controller: _screenShotController,
              child: Column(
                children: [
                  const Gap(20),
                  for (ListTile tile
                      in rideTypeTitles(opacity, rideTypeName, size, textTheme))
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
                        children: [
                          const Icon(Icons.snowboarding),
                          Text('スノーボード', style: textTheme.headline5),
                        ],
                      ),
                    ),
                  ),
                  const Gap(20),
                  boardTile(_scrollController, rideType.firstRecommendBoard, 1,
                      colorScheme),
                  boardTile(_scrollController, rideType.secondRecommendBoard, 2,
                      colorScheme),
                  const Gap(20),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text(
                      rideType.discription,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                shareButton(_screenShotController),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
