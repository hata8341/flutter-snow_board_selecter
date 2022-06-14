import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sbselector/view_model/form_contact_view_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FormContactPage extends HookConsumerWidget {
  const FormContactPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactState = ref.watch(formContactProvider);
    final contactController = ref.watch(formContactProvider.notifier);
    final Completer<WebViewController> _controller =
        Completer<WebViewController>();

    useEffect(() {
      if (Platform.isAndroid) {
        WebView.platform = SurfaceAndroidWebView();
      }
      return () {};
    }, []);
    // WebViewのonPageFinishedとonPageStartedを利用したい
    // indexStackでpositionとstatusを管理する
    return FutureBuilder(
        future: contactController.check(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('お問い合わせ'),
            ),
            body: contactState.conennctionStatus == true
                ? IndexedStack(
                    index: contactState.positon,
                    children: [
                      WebView(
                          initialUrl: formUrl,
                          javascriptMode: JavascriptMode.unrestricted,
                          onWebViewCreated:
                              (WebViewController webViewController) {
                            _controller.complete(webViewController);
                          },
                          onPageFinished: (formUrl) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              contactController.doneLoading(formUrl);
                            });
                          },
                          onPageStarted: (formUrl) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              contactController.startLoading(formUrl);
                            });
                          }),
                      const SizedBox(
                        child: Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  )
                : SafeArea(
                    child: Center(
                      child: Text(
                        'インターネットに接続されていません',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  ),
          );
        });
  }
}
