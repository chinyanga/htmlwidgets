import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoadHtmlWidget{
  
  loadHtmlFromAssets(String filePath, WebViewController webViewController) async {
    String fileHtmlContents = await rootBundle.loadString(filePath);
    webViewController.loadUrl(Uri.dataFromString(fileHtmlContents,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}