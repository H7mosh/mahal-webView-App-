import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Notify_View extends StatefulWidget {
  String webViewLink ;
  Notify_View({@required  this.webViewLink});
  @override
  _Notify_ViewState createState() => _Notify_ViewState();
}

class _Notify_ViewState extends State<Notify_View> {
  @override
  Widget build(BuildContext context) {
    double weedth = MediaQuery
        .of(context)
        .size
        .width;
    double heeght = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
      ),
      body:WebView(
        initialUrl:widget.webViewLink,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
