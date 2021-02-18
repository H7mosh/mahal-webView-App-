import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart'as http;
import 'package:mahal_webview/AllNotify.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseMessaging firebaseMessaging=FirebaseMessaging();

  addTokenToDatabase(token)
  {
    var url='http://192.168.100.168/api/uploadTokens.php';
    http.post(url,body:{ 'user_token' :  token});
  }
  @override
  void initState()
  {
    firebaseMessaging.getToken().then((String token)
    {
      assert(token!=null);
      addTokenToDatabase(token);
      print(token);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('MAHAL'),
        actions: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Notify()),
                    );
                  }
              ),
              Positioned(  // draw a red marble
                top: 8.0,
                right: 12.0,
                child: new Icon(Icons.brightness_1, size: 8.0,
                    color: Colors.amberAccent),
              )
            ],
          ),
        ],
      ),
      body: WebView(
        initialUrl: "https://mahal.app/",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
