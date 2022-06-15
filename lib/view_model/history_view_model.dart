import 'package:riverpod/riverpod.dart';
import 'package:sbselector/const/ridetype.dart';
import 'package:sbselector/db/result.dart';
import 'package:sbselector/model/result.dart';
import 'package:uuid/uuid.dart';

class HistoryNotifier extends StateNotifier<List<Result>> {
  HistoryNotifier(this._read) : super([]);

  final Reader _read;

  Future<void> load() async {
    List<Result> myRideTypes = [];
    await ResultDb.read().then(
      (value) => myRideTypes
        ..clear()
        ..addAll(value),
    );
    state = myRideTypes;
    _sortOrder();
  }

  void _sortOrder() {
    state.sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  void add(RideType rideType) async {
    Result myRideType = Result(
      id: const Uuid().v4(),
      rideType: rideType,
      createdAt: DateTime.now(),
    );
    await ResultDb.create(myRideType);
    await load();
  }

  void delete(String id) async {
    try {
      await ResultDb.delete(id);
      await load();
    } catch (e) {
      print(e);
    }
  }
}

final historyNotifierProvider =
    StateNotifierProvider.autoDispose<HistoryNotifier, List<Result>>((ref) {
  return HistoryNotifier(ref.read);
});
