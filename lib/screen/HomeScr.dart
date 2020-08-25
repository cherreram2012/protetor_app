import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

/*
 *
 * Screen widget <Home>.
 *
 */
class HomeScreen extends StatelessWidget {
  final _key = UniqueKey();
  var _url = "https://protetor.app/";

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
        child: Center(
          child: Expanded(
            child: WebviewScaffold(
              url: _url,
              appCacheEnabled: true,
              withJavascript: true,
              withZoom: false,
            ),
            /*WebView(
                key: _key,
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: _url),
          ),*/
          ),
        ),
      ),
    );
  }
}
