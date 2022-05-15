import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/views/history/history_top.dart';
import 'package:sbselector/views/settings/setting_top.dart';

final bottomBarIndexProvider = StateProvider<int>((ref) => 1);

class DiagnoseTopPage extends HookConsumerWidget {
  DiagnoseTopPage({Key? key}) : super(key: key);

  String title = "診断";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomBarIndex = ref.watch(bottomBarIndexProvider.state);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.search),
            Text(title),
          ],
        ),
      ),
      body: Center(
        child: bottomBarIndex.state == 1
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '$titleトップpage',
                  ),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/diagnoseContent');
                    },
                    child: const Text('診断画面へ'),
                  ),
                ],
              )
            : bottomBarIndex.state == 0
                ? const HistoryList()
                : const SettingList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) => {
          bottomBarIndex.state = index,
        },
        currentIndex: bottomBarIndex.state,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: '履歴',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '診断',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '設定',
          ),
        ],
      ),
    );
  }
}
