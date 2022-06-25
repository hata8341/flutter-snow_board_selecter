import 'package:riverpod/riverpod.dart';
import 'package:sbselector/const/ridetype.dart';
import 'package:sbselector/db/result.dart';
import 'package:sbselector/model/result.dart';
import 'package:uuid/uuid.dart';

class HistoryNotifier extends StateNotifier<List<Result>> {
  HistoryNotifier(this._resultDb) : super([]);

  final ResultDb _resultDb;

  Future<void> load() async {
    List<Result> history = [];
    try {
      await _resultDb.read().then(
            (value) => history
              ..clear()
              ..addAll(value),
          );
      state = history;
      _sortOrder();
    } catch (e) {
      print(e);
    }
  }

  void _sortOrder() {
    state.sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  Future<void> add(RideType rideType) async {
    try {
      Result result = Result(
        id: const Uuid().v4(),
        rideType: rideType,
        createdAt: DateTime.now(),
      );
      await _resultDb.create(result);
      await load();
    } catch (e) {
      print(e);
    }
  }

  void delete(String id) async {
    try {
      await _resultDb.delete(id);
      await load();
    } catch (e) {
      print(e);
    }
  }
}

final historyNotifierProvider =
    StateNotifierProvider.autoDispose<HistoryNotifier, List<Result>>((ref) {
  return HistoryNotifier(ref.read(resultDbProvider));
});
