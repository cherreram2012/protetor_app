import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/*
 *
 * Screen widget <Home>.
 *
 */
class HomeScreen extends StatelessWidget {
  final _key = UniqueKey();
  var _url = "https://protetor.net/";

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
        title: Text("Home"),
      ),
      body: Center(
        child: Center(
            child: Expanded(
          child: WebView(
              key: _key,
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: _url),
        )),
      ),
    );
  }
}
