import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/views/history/history_top.dart';
import 'package:sbselector/views/settings/setting_top.dart';
import 'package:sbselector/widgets/bubble.dart';

final bottomBarIndexProvider = StateProvider<int>((ref) => 1);

final backgroundColorProvider = Provider<Color>((ref) {
  final bottomBarIndex = ref.watch(bottomBarIndexProvider);
  final Color backgroundColor;
  switch (bottomBarIndex) {
    case 1:
      backgroundColor = Colors.blue.shade200;
      break;
    case 0:
      backgroundColor = Colors.white;
      break;
    case 2:
      backgroundColor = Colors.white;
      break;
    default:
      backgroundColor = Colors.white;
  }
  return backgroundColor;
});

class DiagnoseTopPage extends HookConsumerWidget {
  const DiagnoseTopPage({Key? key}) : super(key: key);

  final String title = "診断";

  String switchTitle(int bottomIndex) {
    String title = '';
    switch (bottomIndex) {
      case 1:
        title = '診断';
        break;
      case 0:
        title = "履歴";
        break;
      case 2:
        title = "設定";
        break;
      default:
        '';
    }
    return title;
  }

  Icon switchIcon(int bottomIndex) {
    Icon icon = const Icon(Icons.abc);
    switch (bottomIndex) {
      case 1:
        icon = const Icon(Icons.search);
        break;
      case 0:
        icon = const Icon(Icons.list);
        break;
      case 2:
        icon = const Icon(Icons.settings);
        break;
      default:
        '';
    }
    return icon;
  }

  List<Widget> appBariconTitle(int bottomIndex) {
    List<Widget> iconTitle = [];
    iconTitle.add(switchIcon(bottomIndex));
    iconTitle.add(Text(switchTitle(bottomIndex)));
    return iconTitle;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomBarIndex = ref.watch(bottomBarIndexProvider.state);
    final Size screenSize = MediaQuery.of(context).size;

    final backgroundColor = ref.watch(backgroundColorProvider);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: appBariconTitle(bottomBarIndex.state),
        ),
      ),
      body: bottomBarIndex.state == 1
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  const Spacer(
                    flex: 3,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: screenSize.width * 0.6,
                        height: screenSize.height * 0.32,
                        child: Image.asset(
                          'images/cut_snow_penguin.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Gap(10),
                      Container(
                        height: screenSize.height * 0.2,
                        padding: const EdgeInsets.all(16),
                        decoration: const ShapeDecoration(
                          color: Colors.white,
                          shadows: [
                            BoxShadow(
                              color: Color(0x80000000),
                              offset: Offset(0, 2),
                              blurRadius: 2,
                            ),
                          ],
                          shape: BubbleBorder(),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Text(
                              '自分の思うスノーボードを',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'イメージしてね!!',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    width: screenSize.width * 0.65,
                    height: screenSize.height * 0.065,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/diagnoseContent');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.yellow[700],
                        onPrimary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Text(
                        '診断する',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            )
          : bottomBarIndex.state == 0
              ? Column(
                  children: const [
                    HistoryTopPage(),
                  ],
                )
              : Column(
                  children: [
                    SettingList(),
                  ],
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
