import 'package:intl/intl.dart';
import 'package:riverpod/riverpod.dart';
import 'package:sbselector/db/myRideTypes.dart';
import 'package:sbselector/model/my_ridetype.dart';
import 'package:uuid/uuid.dart';

class MyRideTypesNotifier extends StateNotifier<List<MyRideType>> {
  MyRideTypesNotifier(this.read) : super([]);

  final Reader read;

  int get len => state.length;

  Future<void> loadDb() async {
    List<MyRideType> myRideTypes = [];
    await MyRideTypeDb.read().then(
      (value) => myRideTypes
        ..clear()
        ..addAll(value),
    );
    state = myRideTypes;
  }

  void add(String rideType) async {
    MyRideType myRideType = MyRideType(
      id: const Uuid().v4(),
      rideType: rideType,
      createdAt: DateTime.now(),
    );
    await MyRideTypeDb.create(myRideType);
    loadDb();
  }

  void delete(String id) async {
    try {
      await MyRideTypeDb.delete(id);
      loadDb();
    } catch (e) {
      print(e);
    }
  }

  String getCreateAtStr(MyRideType history) {
    final time = history.createdAt;
    final ymed = DateFormat.yMEd('ja').format(time);
    final hm = DateFormat.Hm('ja').format(time);
    return ymed + hm;
  }
}

final myRideTypesProvider =
    StateNotifierProvider.autoDispose<MyRideTypesNotifier, List<MyRideType>>(
        (ref) {
  return MyRideTypesNotifier(ref.read);
});
