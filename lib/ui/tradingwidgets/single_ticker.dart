import 'package:flutter/material.dart';
import 'package:htmlwidgets/core/load_html_widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SingleTicker extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SingleTickerState();
  }
}
class _SingleTickerState extends State<SingleTicker> {
  
  LoadHtmlWidget loadHtmlWidget = new LoadHtmlWidget();
  var _webViewController; // for more control
  String filePath = 'html_trading_widgets/single_ticker.html';
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: 600,
          width: 300,
          child: WebView(
            initialUrl: '',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _webViewController = webViewController;//for global access
              loadHtmlWidget.loadHtmlFromAssets(filePath,webViewController);
            },
             navigationDelegate: (NavigationRequest request) {
            if (request.url.startsWith('https://www.tradingview.com/')) {
              print('blocking navigation to $request}');
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
            }
          ),
        ),
    );
  }
}