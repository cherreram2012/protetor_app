import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'dart:async';

import 'HomeScr.dart';
import 'ZemaPage.dart';

/*
 *
 * Screen widget <Home>.
 *
 */
class ZemaProtetorScreen extends StatelessWidget {
  final flutterWebViewPlugin = FlutterWebviewPlugin();
  final _key = UniqueKey();
  var _url = "https://zema.protetor.app/";
  Completer<WebViewController> _controller = Completer<WebViewController>();

  /*
   * Widget constructor.
   */
  ZemaProtetorScreen({Key key}) : super(key: key);

  /*
   * Widget render method.
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
            // action button
           FlatButton(
              child: Text("Zema Saúde"),
              onPressed:  () {
                flutterWebViewPlugin.close();
                
                      MaterialPageRoute(builder:(context) => ZemaProtetorScreen());
                    },),
            FlatButton(
              child: Text("Minha Conta"),
              onPressed:  () {
                flutterWebViewPlugin.close();
                      MaterialPageRoute(builder:(context) => HomeScreen());
                    },),
            FlatButton(
              child: Text("Lojas Zema"),
              onPressed:  () {
                flutterWebViewPlugin.close();
                      MaterialPageRoute(builder:(context) =>ZemaScreen());
                    },),     
        ]
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
