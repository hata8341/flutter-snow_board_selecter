import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/view_model/my_ridetypes_view_model.dart';
import 'package:sbselector/widgets/history_list.dart';

class HistoryTopPage extends HookConsumerWidget {
  const HistoryTopPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historiesController = ref.watch(myRideTypesProvider.notifier);
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
  }
}
