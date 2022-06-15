import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/view_model/history_view_model.dart';
import 'package:sbselector/widgets/history_list.dart';

class HistoryTopPage extends ConsumerWidget {
  const HistoryTopPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historiesController = ref.watch(historyNotifierProvider.notifier);
    return Column(
      children: [
        FutureBuilder(
          future: historiesController.load(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return const HistoryList();
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ],
    );
  }
}
