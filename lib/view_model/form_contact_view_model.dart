import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/model/form_contact_state.dart';

const String formUrl =
    'https://docs.google.com/forms/d/e/1FAIpQLSc8eWf6Yx413g5K3F1KVXgswaoSkUUCEs_xg2E28ZY7im37mg/viewform';

class FormContactStateNotifier extends StateNotifier<FormContactState> {
  FormContactStateNotifier() : super(const FormContactState());

  doneLoading(String url) {
    state = state.copyWith(positon: 0);
  }

  startLoading(String url) {
    state = state.copyWith(positon: 1);
  }

  Future<void> check() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        state = state.copyWith(conennctionStatus: true);
      }
    } on SocketException catch (_) {
      state = state.copyWith(conennctionStatus: false);
    }
  }
}

final formContactProvider = StateNotifierProvider.autoDispose<
    FormContactStateNotifier,
    FormContactState>((ref) => FormContactStateNotifier());
