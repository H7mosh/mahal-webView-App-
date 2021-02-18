import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mahal_webview/MyCardNotify.dart';
import 'package:http/http.dart'as http;
import 'package:mahal_webview/NotifyWebView.dart';

class Notify extends StatefulWidget {
  @override
  _NotifyState createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  Future getNotifyData() async{
    var url='http://192.168.100.168/api/getNotifyData.php';
    var response =await http.get(url);
    return jsonDecode(response.body);
  }

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
      body: FutureBuilder(
        future: getNotifyData(),
        builder: (context ,snapshot)
        {
          if(snapshot.hasError)
            print(snapshot.error);
          return snapshot.hasData? Container(
            width: weedth,
            height: heeght,
            color: Colors.white,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                height: heeght,
                width: weedth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 50.0, right: 20.0, bottom: 8.0),
                          child: Text('كل ألاشعارات' , style: TextStyle(fontFamily: 'Cairo',fontWeight: FontWeight.bold ,fontSize: 20.0 , color: Colors.black87),),
                        ),
                       Padding(
                         padding: const EdgeInsets.only(
                             top: 50.0, right: 20.0, bottom: 8.0),
                         child: IconButton(icon: Icon(Icons.arrow_forward ,size: 30.0 , color: Colors.black54,) , onPressed: (){
                           Navigator.pop(context);
                         }),
                       ),
                      ],
                    ),
                    Container(
                      height: heeght * 0.83,
                      width: weedth,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context , index){
                            return MyCard(header:snapshot.data[index]['header'],
                              desc: snapshot.data[index]['description'],
                              weblink: snapshot.data[index]['webview_link'],
                              imageName: "http://192.168.100.168/api/imageUploads/${snapshot.data[index]['image']}",
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Notify_View(webViewLink: snapshot.data[index]['webview_link'])),
                                );
                              },
                            );
                          }
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ) : Center(child: CircularProgressIndicator(),);
        }
      ),
    );
  }

}