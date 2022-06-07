import 'package:intl/intl.dart';
import 'package:riverpod/riverpod.dart';
import 'package:sbselector/const/rideType.dart';
import 'package:sbselector/db/result.dart';
import 'package:sbselector/model/result.dart';
import 'package:uuid/uuid.dart';

class HistoryNotifier extends StateNotifier<List<Result>> {
  HistoryNotifier(this._read) : super([]);

  final Reader _read;

  int get len => state.length;

  Future<void> load() async {
    List<Result> myRideTypes = [];
    await MyRideTypeDb.read().then(
      (value) => myRideTypes
        ..clear()
        ..addAll(value),
    );
    state = myRideTypes;
  }

  void add(RideType rideType) async {
    Result myRideType = Result(
      id: const Uuid().v4(),
      rideType: rideType,
      createdAt: DateTime.now(),
    );
    await MyRideTypeDb.create(myRideType);
    load();
  }

  void delete(String id) async {
    try {
      await MyRideTypeDb.delete(id);
      load();
    } catch (e) {
      print(e);
    }
  }

  Result getCurrResult(int index) {
    return state[index];
  }

  String getCreatedAtStr(Result history) {
    final time = history.createdAt;
    final ymed = DateFormat.yMEd('ja').format(time);
    final hm = DateFormat.Hm('ja').format(time);
    return ymed + hm;
  }
}

final historyNotifierProvider =
    StateNotifierProvider.autoDispose<HistoryNotifier, List<Result>>((ref) {
  return HistoryNotifier(ref.read);
});
