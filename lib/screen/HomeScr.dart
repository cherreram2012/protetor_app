import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'dart:async';

/*
 *
 * Screen widget <Home>.
 *
 */
class HomeScreen extends StatelessWidget {
  final _key = UniqueKey();
  var _url = "https://protetor.app/";
  Completer<WebViewController> _controller = Completer<WebViewController>();

  /*
   * Widget constructor.
   */
  HomeScreen({Key key}) : super(key: key);

  /*
   * Widget render method.
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Protetor"),
      ),
      body: Center(
        child: WebviewScaffold(
          url: _url,
        ),
        /*WebView(
          key: _key,
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: _url,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ),*/
      ),
    );
  }
}
