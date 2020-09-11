import 'dart:async';
import 'package:flutter/material.dart';
import 'package:protetor_app/constantes.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

///
///
/// Screen widget <HomeScreenState>.
///
///
class _HomeScreenState extends State<HomeScreen> {
  String _url;
  OptionAppLink _option;
  final flutterWebViewPlugin = FlutterWebviewPlugin();
  StreamSubscription<WebViewStateChanged> _onStateChanged;
  StreamSubscription<WebViewHttpError> _onHttpError;

  ///
  /// Widget INIT_STATE method.
  ///
  @override
  void initState() {
    super.initState();

    flutterWebViewPlugin.hide();
    _option = OptionAppLink.BtnZemaSaude;
    _url = AppUri.ZemaSaudeLink;

    // Acrescento um listener ao evento onStateChanged
    _onStateChanged = flutterWebViewPlugin.onStateChanged.listen(
      (WebViewStateChanged state) {
        switch (state.type) {
          case WebViewState.startLoad:
            print("======================");
            print('startLoad');
            print("======================");
            break;
          case WebViewState.finishLoad:
            flutterWebViewPlugin.show();
            print("======================");
            print('finishLoad');
            print("======================");
            break;
          default:
        }
      },
    );

    // Acrescento um listener ao evento onHttpError
    _onHttpError =
        flutterWebViewPlugin.onHttpError.listen((WebViewHttpError error) {
      print("======================");
      print('onHttpError');
      print("======================");
    });
  }

  ///
  /// Widget DISPOSE method.
  ///
  @override
  void dispose() {
    // Apago os listener criados
    _onStateChanged.cancel();
    _onHttpError.cancel();

    // Libero o WebViewPlugin
    flutterWebViewPlugin.dispose();

    super.dispose();
  }

  ///
  /// Widget RENDER method.
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFF1F3976), actions: <Widget>[
        // action button
        FlatButton(
          child: Row(
            children: <Widget>[
              Icon(Icons.star,
                  color: (_option == OptionAppLink.BtnZemaSaude)
                      ? const Color(ItemAtivo)
                      : const Color(ItemInativo),
                  size: 15),
              Text(" Zema Saúde",
                style: TextStyle(
                  color: (_option == OptionAppLink.BtnZemaSaude)
                      ? const Color(ItemAtivo)
                      : const Color(ItemInativo),
                ),
              ),
            ],
          ),
          onPressed: () {
            flutterWebViewPlugin.hide();
            flutterWebViewPlugin.reloadUrl(AppUri.ZemaSaudeLink);
            setState(() {
              _option = OptionAppLink.BtnZemaSaude;
            });
          },
        ),
        FlatButton(
          child: Row(
            children: <Widget>[
              Icon(Icons.add_shopping_cart,
                  color: (_option == OptionAppLink.BtnZemaLojas)
                      ? const Color(ItemAtivo)
                      : const Color(ItemInativo),
                  size: 15),
              Text(" Lojas Zema",
                style: TextStyle(
                  color: (_option == OptionAppLink.BtnZemaLojas)
                      ? const Color(ItemAtivo)
                      : const Color(ItemInativo),
                ),
              ),
            ],
          ),
          onPressed: () {
            flutterWebViewPlugin.hide();
            flutterWebViewPlugin.reloadUrl(AppUri.ZemaLojasLink);
            setState(() {
              _option = OptionAppLink.BtnZemaLojas;
            });
          },
        ),
        FlatButton(
          child: Row(
            children: <Widget>[
              Icon(Icons.account_circle,
                  color: (_option == OptionAppLink.BtnMinhaConta)
                      ? const Color(ItemAtivo)
                      : const Color(ItemInativo),
                  size: 15),
              Text(" Minha Conta",
                style: TextStyle(
                  color: (_option == OptionAppLink.BtnMinhaConta)
                      ? const Color(ItemAtivo)
                      : const Color(ItemInativo),
                ),
              ),
            ],
          ),
          onPressed: () {
            flutterWebViewPlugin.hide();
            flutterWebViewPlugin.reloadUrl(AppUri.MinhaContaLink);
            setState(() {
              _option = OptionAppLink.BtnMinhaConta;
            });
          },
        ),
      ]),
      body: Center(
        child: WebviewScaffold(
          url: _url,
        ),
      ),
    );
  }
}
