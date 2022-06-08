import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/view_model/page_view_model.dart';

class TopPage extends HookConsumerWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = ref.watch(pageStateProvider);
    final pageController = ref.watch(pageStateProvider.notifier);

    return Scaffold(
      backgroundColor: pageState.bottomBarIndex.backgroundColor,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            pageState.bottomBarIndex.icon,
            Text(pageState.bottomBarIndex.title),
          ],
        ),
      ),
      body: pageState.bottomBarIndex.page,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) => {pageController.changeIndex(index)},
        currentIndex: pageState.bottomBarIndex.value,
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
