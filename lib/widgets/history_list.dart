import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/view_model/my_ridetypes_view_model.dart';
import 'package:sbselector/view_model/page_view_model.dart';

class HistoryList extends HookConsumerWidget {
  const HistoryList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final histories = ref.watch(myRideTypesProvider);
    final historiesController = ref.watch(myRideTypesProvider.notifier);
    final historyLen = historiesController.len;

    final pageController = ref.watch(pageProvider.notifier);
    return Expanded(
        child: historyLen > 0
            ? ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                shrinkWrap: true,
                itemCount: historyLen,
                itemBuilder: (context, index) {
                  final history = histories[index];
                  final date = historiesController.getCreateAtStr(history);
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/historyDetail',
                        arguments: history,
                      );
                    },
                    child: Column(
                      children: [
                        ListTile(
                          leading: Text('テスト$index'),
                          title: Text(
                            pageController.egToJp(history.rideType),
                            style: const TextStyle(fontSize: 18.0),
                          ),
                          subtitle: Text('日付:' + date),
                          trailing: const Icon(Icons.keyboard_arrow_right),
                        ),
                        const Divider(),
                      ],
                    ),
                  );
                },
              )
            : Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Text(
                      '診断結果はありません',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
              ));
  }
}
