import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/const/result.dart';
import 'package:sbselector/model/result.dart';

class ResultStateNotifier extends StateNotifier<Result> {
  ResultStateNotifier.init(this.read, {required String rideType})
      : super(createResultData(rideType));
  final Reader read;
}

final resultProvider = StateNotifierProvider.autoDispose
    .family<ResultStateNotifier, Result, String>((ref, rideType) {
  return ResultStateNotifier.init(ref.read, rideType: rideType);
});
