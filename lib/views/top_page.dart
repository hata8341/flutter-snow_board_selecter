import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/view_model/page_view_model.dart';
import 'package:sbselector/view_model/theme_view_mode.dart';

class TopPage extends ConsumerWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = ref.watch(pageStateProvider);
    final pageController = ref.watch(pageStateProvider.notifier);
    final themeController = ref.watch(themeStateProvider.notifier);

    return Scaffold(
      backgroundColor: themeController.getScaffoldBackgroundColor(),
      appBar: AppBar(
        backgroundColor: themeController.getBarColor(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              pageState.bottomBarIndex.icon,
              color: themeController.getAppBarTextIconColor(),
            ),
            Text(
              pageState.bottomBarIndex.title,
              style: Theme.of(context).textTheme.headline5?.copyWith(
                  fontWeight: FontWeight.normal,
                  color: themeController.getAppBarTextIconColor()),
            ),
          ],
        ),
      ),
      body: pageState.bottomBarIndex.page,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: themeController.getBarColor(),
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
