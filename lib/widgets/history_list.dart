import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/const/ridetype.dart';
import 'package:sbselector/model/result.dart';
import 'package:sbselector/view_model/history.dart';

class HistoryList extends HookConsumerWidget {
  const HistoryList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final history = ref.watch(historyNotifierProvider);
    return Expanded(
        child: history.isNotEmpty
            ? ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                shrinkWrap: true,
                itemCount: history.length,
                itemBuilder: (context, index) {
                  final Result result = history[index];
                  final RideType rideType = result.rideType;
                  final date = result.createdAtStr;
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/historyDetail',
                        arguments: result,
                      );
                    },
                    child: Column(
                      children: [
                        ListTile(
                          leading: Container(
                            decoration: BoxDecoration(
                              color: rideType.iconColor,
                              borderRadius: BorderRadius.circular(55.0),
                            ),
                            padding: const EdgeInsets.all(4.0),
                            height: 55.0,
                            width: 55.0,
                            child: Center(
                              child: Text(
                                rideType.iconInitial,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            rideType.nameJp,
                            style: const TextStyle(fontSize: 18.0),
                          ),
                          subtitle: Text('診断日:' + date),
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
