import 'package:flutter/material.dart';
import 'package:protetor_app/screen/ZemaPage.dart';
import 'package:protetor_app/screen/ZemaProtetorPage.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'dart:async';

/*
 *
 * Screen widget <Home>.
 *
 */
class HomeScreen extends StatelessWidget {
  final flutterWebViewPlugin = FlutterWebviewPlugin();
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
        actions: <Widget>[
            // action button
            FlatButton(
              child: Text("Zema Saúde"),
              onPressed:  () {
                flutterWebViewPlugin.close();
                flutterWebViewPlugin.launch("https://zema.protetor.app/");
                //MaterialPageRoute(builder:(context) => ZemaProtetorScreen());
                //_url =  "https://zema.protetor.app/";
                    },),
            FlatButton(
              child: Text("Minha Conta"),
              onPressed:  () {
                flutterWebViewPlugin.close();
                flutterWebViewPlugin.launch("https://protetor.app/");
                //MaterialPageRoute(builder:(context) => HomeScreen());
                    },),
            FlatButton(
              child: Text("Lojas Zema"),
              onPressed:  () {
                flutterWebViewPlugin.close();
                flutterWebViewPlugin.launch("https://zema.com/");
                      //MaterialPageRoute(builder:(context) => ZemaScreen());
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
