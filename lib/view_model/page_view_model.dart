import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/const/rideType.dart';

class PageNotifier extends StateNotifier<void> {
  PageNotifier(this._read) : super(null);

  final Reader _read;

  String checkWriteInRideType(RideType rideType) {
    final rideTypeName = rideType.nameJp;
    if (rideTypeName == 'フリーラン・パウダー') {
      final words = rideTypeName.split('・');
      final strBuffer = StringBuffer(words[0])
        ..writeln()
        ..write(words[1]);
      return strBuffer.toString();
    }

    return rideTypeName;
  }
}

final pageProvider = StateNotifierProvider<PageNotifier, void>((ref) {
  return PageNotifier((ref.read));
});
