import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/const/ride_type.dart';
import 'package:sbselector/view_model/page_view_model.dart';
import 'package:sbselector/widgets/board_tile.dart';
import 'package:sbselector/widgets/delete_dialog.dart';
import 'package:sbselector/widgets/end_dialog.dart';
import 'package:sbselector/widgets/ridetype_tiles.dart';
import 'package:sbselector/widgets/share_button.dart';
import 'package:screenshot/screenshot.dart';

class ResultDetail extends ConsumerWidget {
  ResultDetail({Key? key, required this.rideType, required this.id})
      : super(key: key);
  final RideType rideType;
  final String? id;

  final String _title = "診断結果";

  static const navigateToTopPageButtonKey = Key('navigateToTopPage');

  static const historyDeleteButtonKey = Key('historyDelete');

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
    final String routeName = ModalRoute.of(context)?.settings.name as String;
    final bool currRouteState = checkRoute(routeName);
    final PageStateNotifier pageController =
        ref.watch(pageStateProvider.notifier);
    final String rideTypeName = pageController.checkWriteInRideType(rideType);

    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: Consumer(
          builder: (context, ref, _) {
            return IconButton(
              key: navigateToTopPageButtonKey,
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.popUntil(
                  context,
                  ModalRoute.withName('/'),
                );
              },
            );
          },
        ),
        centerTitle: true,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Icon(Icons.search),
              Text(_title),
            ],
          ),
        ),
        actions: [
          currRouteState
              ? IconButton(
                  key: historyDeleteButtonKey,
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () async {
                    await showSelfDialog(
                      deleteDialog(context, ref, id!),
                    );
                  },
                )
              : Opacity(
                  opacity: 0,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.snowing),
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
                  for (ListTile tile in rideTypeTitles(rideTypeName, textTheme))
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
                          Text('スノーボード', style: textTheme.headline6),
                        ],
                      ),
                    ),
                  ),
                  const Gap(20),
                  boardTile(
                    _scrollController,
                    rideType.firstRecommendBoard,
                    1,
                  ),
                  boardTile(
                    _scrollController,
                    rideType.secondRecommendBoard,
                    2,
                  ),
                  const Gap(20),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Text(
                      rideType.description,
                      style: const TextStyle(
                        fontSize: 14,
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
                shareButton(context, _screenShotController),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
