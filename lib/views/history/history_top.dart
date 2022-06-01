import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/view_model/my_ridetypes_view_model.dart';

class HistoryTopPage extends HookConsumerWidget {
  const HistoryTopPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historiesController = ref.watch(myRideTypesProvider.notifier);
    print('履歴の数');
    return FutureBuilder(
      future: historiesController.loadDb(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const HistoryList();
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
    // return ListView.builder(
    //   padding: const EdgeInsets.symmetric(
    //     horizontal: 10,
    //     vertical: 10,
    //   ),
    //   scrollDirection: Axis.vertical,
    //   shrinkWrap: true,
    //   itemCount: histories.length,
    //   itemBuilder: (context, index) {
    //     final item = histories[index];
    //     return GestureDetector(
    //       onTap: () {
    //         Navigator.pushNamed(
    //           context,
    //           '/historyDetail',
    //           arguments: index.toString(),
    //         );
    //       },
    //       child: Column(
    //         children: [
    //           ListTile(
    //             leading: const Text('テスト'),
    //             title: Text(item.rideType),
    //             subtitle: Text('日付:$index'),
    //             trailing: const Icon(Icons.keyboard_arrow_right),
    //           ),
    //           const Divider(),
    //         ],
    //       ),
    //     );
    //   },
    // );
  }
}

class HistoryList extends HookConsumerWidget {
  const HistoryList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final histories = ref.watch(myRideTypesProvider);
    print(histories.length);
    final historiesController = ref.watch(myRideTypesProvider.notifier);
    return Expanded(
        child: ListView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      shrinkWrap: true,
      itemCount: histories.length,
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
                title: Text(history.rideType),
                subtitle: Text('日付:' + date),
                trailing: const Icon(Icons.keyboard_arrow_right),
              ),
              const Divider(),
            ],
          ),
        );
      },
    ));
  }
}
